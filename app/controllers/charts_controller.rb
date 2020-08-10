class ChartsController < ApplicationController

    def update
        connection = PG::Connection.new(host:'localhost',port:'5432',dbname:'RocketApp_second_development',user:'postgres',password:'password')
            
        connection.prepare('addFactContact', "INSERT INTO fact_contacts (contact_id,creation_date,company_name,email,project_name) VALUES ($1,$2,$3,$4,$5)")
        connection.prepare('addFactQuotes', "INSERT INTO fact_quotes (quote_id,creation_date,company_name,email,nb_elevator) VALUES ($1,$2,$3,$4,$5)")
        connection.prepare('addFactElevator', "INSERT INTO fact_elevators (serial_number,commissioning_date,building_id,customer_id, building_city) VALUES ($1,$2,$3,$4,$5)")
        connection.prepare('addDimCustomers', "INSERT INTO dim_customers (creation_date,company_name,contact_name, contact_email,nb_elevators, contact_city) VALUES ($1,$2,$3,$4,$5,$6)")
    
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


    end
end
