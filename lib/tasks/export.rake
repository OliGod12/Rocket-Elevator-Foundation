namespace :export do

    desc "Export data to psql DWH"
    task dwh: :environment do
    Rake::Task["export:dwh"].invoke

        #### this file has been modified inside the server to use credentials of the server
        connection = PG::Connection.new(host:'codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com',port:'5432',dbname:'Olivier_Godbout',user:'codeboxx',password:'Codeboxx1!')
            
        connection.prepare('addFactContact', "INSERT INTO fact_contacts (contact_id,creation_date,company_name,email,project_name) VALUES ($1,$2,$3,$4,$5)")
        connection.prepare('addFactQuotes', "INSERT INTO fact_quotes (quote_id,creation_date,company_name,email,nb_elevator) VALUES ($1,$2,$3,$4,$5)")
        connection.prepare('addFactElevator', "INSERT INTO fact_elevators (serial_number,commissioning_date,building_id,customer_id, building_city) VALUES ($1,$2,$3,$4,$5)")
        connection.prepare('addDimCustomers', "INSERT INTO dim_customers (creation_date,company_name,contact_name, contact_email,nb_elevators, contact_city) VALUES ($1,$2,$3,$4,$5,$6)")
        connection.prepare('addFactIntervention', "INSERT INTO fact_intervention (employee_id, building_id, battery_id, column_id, elevator_id, start_of_intervention, end_of_intervention, result, report, status ) VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10)")
    
        connection.exec ("TRUNCATE fact_contacts RESTART IDENTITY")
        Lead.all.each do |a| 
            connection.exec_prepared('addFactContact',[a.id, a.created_at, a.Compagny_Name, a.Email, a.Project_Name])
        end
        puts "migration to fact_contacts completed"
          
        connection.exec ("TRUNCATE fact_quotes RESTART IDENTITY")
        Quote.all.each do |b| 
            connection.exec_prepared('addFactQuotes',[b.id, b.created_at, b.Company_Name, b.Email,b.Nb_Ele_Suggested])
        end
        puts "migration to fact_quotes completed"
        connection.exec ("TRUNCATE fact_elevators RESTART IDENTITY")
            Elevator.all.each do |c|
            connection.exec_prepared('addFactElevator',[c.serial_number, c.commission_date, c.column.battery.building.id, c.column.battery.building.customer_id, c.column.battery.building.address.city])
        end
        puts "migration to fact_elevators completed"

        connection.exec ("TRUNCATE dim_customers RESTART IDENTITY")
        Customer.all.each do |d|
            nbElevators = 0   
            d.building.all.each do |x|
                x.battery.all.each do |y|             
                    y.column.all.each do |z|
                        nbElevators += z.elevator.count
                    end
                end
            end
            connection.exec_prepared('addDimCustomers',[ d.customer_create_date, d.company_name, d.full_name_company_contact, d.company_contact_email, nbElevators, d.address.city])
        end
        puts "migration to dim_customers completed" 

        connection.exec ("TRUNCATE fact_intervention RESTART IDENTITY")
        Elevator.all.each do |e| 
            if e.status == "Active" && e.id % 33 == 0
                min_date = Time.now - 12.months
                max_date = Time.now - 6.month
                s_o_i = rand(min_date..max_date)
                puts(s_o_i)
                e_o_i = s_o_i + 2.days
                result = "Success"
                report = "Elevator service is complete"
                status = "Complete"
            elsif e.status == "Inactive"
                min_date = Time.now + 1.week
                max_date = Time.now + 2.weeks
                s_o_i = rand(min_date..max_date)
                e_o_i = nil
                result = "Incomplete"
                report = "Elevator repair scheduled"
                status = "Pending"
            elsif e.status == "Intervention"
                min_date = Time.now - 3.months
                max_date = Time.now - 1.month
                s_o_i = rand(min_date..max_date)
                e_o_i = nil
                result = ["Incomplete", "Failure"].sample
                report = "Elevator intervention has begun"
                status = ["InProgress", "Interuppted", "Resumed"].sample
            end
            if s_o_i != nil
                connection.exec_prepared('addFactIntervention',[e.column.battery.employee_id, e.column.battery.building.id, e.column.battery.id, e.column.id, e.id, s_o_i , e_o_i, result, report, status])
            end
        end
        puts "migration to fact_intervention completed"
    end 
end