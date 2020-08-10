# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
fake_user1 = User.create!(email: 'test1@gmail.com', password: '123456', password_confirmation: '123456')
fake_user2 = User.create!(email: 'test2@gmail.com', password: '123456', password_confirmation: '123456')
real_address1 = Address.create!(type_of_address: "Home", status: "Active", entity: "Building", number_and_street: "685 Rue Goyette", suite_or_apartment: "Apt.300", city: "Longueuil", postal_code: "J4J 2X6", country: "CAN", longitude: -73.468410, latitude: 45.536640)
real_address2 = Address.create!(type_of_address: "Home", status: "Active", entity: "Building", number_and_street: "675 Rue Goyette", suite_or_apartment: "Apt.300", city: "Longueuil", postal_code: "J4J 2X6", country: "CAN", longitude: -73.469208, latitude:45.535530)



User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', admin: true) if Rails.env.development?

bob1 = User.create!(first_name: "Bob", last_name: "Gratton", title: "Clown", email: "bobgratton@bg", password: "123456", password_confirmation: "123456", admin: true)
bob = Employee.create!(first_name: bob1.first_name, last_name: bob1.last_name, title: bob1.title, email: bob1.email, password: bob1.password, password_confirmation: bob1.password_confirmation, user_id: bob1.id)

Customer.create!(user_id: fake_user1.id, customer_create_date: fake_user1.created_at, company_name: "testuser1", address_id: real_address1.id, full_name_company_contact: "allo1", company_contact_phone: "123456789", company_contact_email: "whytho1@gmail.com", full_name_STA: bob.first_name+" " +bob.last_name, phone_TA: "54321", email_TA: "why1@gmail.com")
Customer.create!(user_id: fake_user2.id, customer_create_date: fake_user2.created_at, company_name: "testuser2", address_id: real_address2.id, full_name_company_contact: "allo2", company_contact_phone: "987654321", company_contact_email: "whytho2@gmail.com", full_name_STA: bob.first_name+" " +bob.last_name, phone_TA: "12345", email_TA: "why2@gmail.com")

nicolas = User.create!(first_name: 'Nicolas', last_name: 'Genest', title: 'Comm Rep', email: 'nicolas.genest@codeboxx.biz', password: '123456', password_confirmation: '123456', admin: true) 
nadya = User.create!(first_name: 'Nadya', last_name: 'Fortier', title: 'Director', email: 'nadya.fortier@codeboxx.biz', password: '123456', password_confirmation: '123456', admin: true )
martin = User.create!(first_name: 'Martin', last_name: 'Chantal', title: 'Director Assistant', email: 'martin.chantal@codeboxx.biz', password: '123456', password_confirmation: '123456', admin: true) 
mathieuH = User.create!(first_name: 'Mathieu', last_name: 'Houde', title: 'Captain', email: 'mathieu.houde@codeboxx.biz', password: '123456', password_confirmation: '123456', admin: true)
david = User.create!(first_name: 'David', last_name: 'Boutin', title: 'Engineer', email: 'david.boutin@codeboxx.biz', password: '123456', password_confirmation: '123456', admin: true) 
mathieuL = User.create!(first_name: 'Mathieu', last_name: 'Lortie', title: 'Engineer', email: 'mathieu.lortie@codeboxx.biz', password: '123456', password_confirmation: '123456', admin: true) 
thomas = User.create!(first_name: 'Thomas', last_name: 'Carrier', title: 'Engineer', email: 'thomas.carrier@codeboxx.biz', password: '123456', password_confirmation: '123456', admin: true) 

nicolas1 = Employee.create!(first_name: nicolas.first_name, last_name: nicolas.last_name, title: nicolas.title, email: nicolas.email, password: nicolas.password, password_confirmation: nicolas.password_confirmation, user_id: nicolas.id)
nadya1 = Employee.create!(first_name: nadya.first_name, last_name: nadya.last_name, title: nadya.title, email: nadya.email, password: nadya.password, password_confirmation: nadya.password_confirmation, user_id: nadya.id)
martin1 = Employee.create!(first_name: martin.first_name, last_name: martin.last_name, title: martin.title, email: martin.email, password: martin.password, password_confirmation: martin.password_confirmation, user_id: martin.id)
mathieuH1 = Employee.create!(first_name: mathieuH.first_name, last_name: mathieuH.last_name, title: mathieuH.title, email: mathieuH.email, password: mathieuH.password, password_confirmation: mathieuH.password_confirmation, user_id: mathieuH.id)
david1 = Employee.create!(first_name: david.first_name, last_name: david.last_name, title: david.title, email: david.email, password: david.password, password_confirmation: david.password_confirmation, user_id: david.id)
mathieuL1 = Employee.create!(first_name: mathieuL.first_name, last_name: mathieuL.last_name, title: mathieuL.title, email: mathieuL.email, password: mathieuL.password, password_confirmation: mathieuL.password_confirmation, user_id: mathieuL.id)
thomas1 = Employee.create!(first_name: thomas.first_name, last_name: thomas.last_name, title: thomas.title, email: thomas.email, password: thomas.password, password_confirmation: thomas.password_confirmation, user_id: thomas.id)




require 'faker'
require 'date'
require 'json'

puts "importing quotes and leads... this could take a while ..."
300.times do |n|
    nameF = Faker::Name.name
    businessF = Faker::Company.name
    emailF = Faker::Internet.email
    phoneF = Faker::PhoneNumber.phone_number
    projname = Faker::Lorem.word
    descriptionF = Faker::Lorem.sentence(word_count: 4, supplemental: true, random_words_to_add: 3)
    departmentF = ["Question","Corporate","Residential"].sample
    informationF = Faker::Lorem.paragraph(sentence_count: 3, supplemental: false, random_sentences_to_add: 3)
    yearF = rand(2017..2020)
    monthF = rand(1..12)
    if monthF == 2
        dayF = rand(1..28)
    else
        dayF = rand(1..30)
    end
    if yearF == 2020
        monthF = rand(1..7)
    end

    
    c = Date.new(yearF, monthF, dayF)
    c.strftime("%F")
    # fileF = ""

    Lead.create(
        Full_Name: nameF,
        Compagny_Name: businessF,
        Email: emailF,
        Phone: phoneF,
        Project_Name: projname,
        Project_Description: descriptionF,
        Department: departmentF,
        Message: informationF,
        File_name: "",
        File_Data: "",
        created_at: c,
        updated_at: c
    )

    r = rand(3)
    
    if r == 0
        building_type = "residential"
        product_Quality = ["Standard","Premium","Excellium"].sample
        if product_Quality == "Standard"
            price_per_elev = 7565
            fee = 0.1
        elsif product_Quality == "Premium"
            price_per_elev = 12345
            fee = 0.13
        else
            price_per_elev = 15400
            fee = 0.16
        end
        x = rand(50..500)
        y = rand(2..45)
        z = rand(3)

        cages = rand(1..24)

        Quote.create(
            Full_Name: nameF,
            Company_Name: businessF,
            Email: emailF,
            Building_Type: building_type,
            Product_Quality: product_Quality,
            Nb_Appartement: x,
            Nb_Floor: y,
            Nb_Basement: z,
            Nb_Ele_Suggested: cages,
            Price_Per_Ele: price_per_elev,
            Subtotal: cages * price_per_elev,
            Install_Fee: cages * price_per_elev * fee,
            Final_Price: cages * price_per_elev * (1+fee),
            created_at: c,
            updated_at: c
        )
    elsif r == 1
        building_type = "commercial"
        product_Quality = ["Standard","Premium","Excellium"].sample
        if product_Quality == "Standard"
            price_per_elev = 7565
            fee = 0.1
        elsif product_Quality == "Premium"
            price_per_elev = 12345
            fee = 0.13
        else
            price_per_elev = 15400
            fee = 0.16
        end
        x = rand(50..500)
        y = rand(2..45)
        z = rand(3)

        cages = rand(1..24)

        Quote.create(
            Full_Name: nameF,
            Company_Name: businessF,
            Email: emailF,
            Building_Type: building_type,
            Product_Quality: product_Quality,
            Nb_Business: x,
            Nb_Floor: y,
            Nb_Basement: z,
            Nb_Cage: cages,
            Nb_Parking: x,
            Nb_Ele_Suggested: cages,
            Price_Per_Ele: price_per_elev,
            Subtotal: cages * price_per_elev,
            Install_Fee: cages * price_per_elev * fee,
            Final_Price: cages * price_per_elev * (1+fee),
            created_at: c,
            updated_at: c
        )
    elsif r == 2
        building_type = "corporate"
        product_Quality = ["Standard", "Premium", "Excellium"].sample
        if product_Quality == "Standard"
            price_per_elev = 7565
            fee = 0.1
        elsif product_Quality == "Premium"
            price_per_elev = 12345
            fee = 0.13
        else
            price_per_elev = 15400
            fee = 0.16
        end
        x = rand(50..500)
        y = rand(2..45)
        z = rand(3)

        cages = rand(1..24)

        Quote.create(
            Full_Name: nameF,
            Company_Name: businessF,
            Email: emailF,
            Building_Type: building_type,
            Product_Quality: product_Quality,
            Nb_Company: x,
            Nb_Floor: y,
            Nb_Basement: z,
            Nb_Parking: x,
            Nb_OccupantPerFloor: rand(300..500),
            Nb_Ele_Suggested: cages,
            Price_Per_Ele: price_per_elev,
            Subtotal: cages * price_per_elev,
            Install_Fee: cages * price_per_elev * fee,
            Final_Price: cages * price_per_elev * (1+fee),
            created_at: c,
            updated_at: c
        )
    else
        building_type = "hybrid"
        product_Quality = ["Standard","Premium","Excellium"].sample
        if product_Quality == "Standard"
            price_per_elev = 7565
            fee = 0.1
        elsif product_Quality == "Premium"
            price_per_elev = 12345
            fee = 0.13
        else
            price_per_elev = 15400
            fee = 0.16
        end
        x = rand(50..500)
        y = rand(2..45)
        z = rand(3)

        cages = rand(1..24)

        Quote.create(
            Full_Name: nameF,
            Company_Name: businessF,
            Email: emailF,
            Building_Type: building_type,
            Product_Quality: product_Quality,
            Nb_Business: x,
            Nb_Floor: y,
            Nb_Basement: z,
            Nb_Parking: x,
            Nb_OccupantPerFloor: rand(300..500),
            Nb_OperatingHour: rand(1..24),
            Nb_Ele_Suggested: cages,
            Price_Per_Ele: price_per_elev,
            Subtotal: cages * price_per_elev,
            Install_Fee: cages * price_per_elev * fee,
            Final_Price: cages * price_per_elev * (1+fee),
            created_at: c,
            updated_at: c
        )
    end
end

# csv_text = File.read(Rails.root.join('db', 'ca-500.csv'))
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# csv.each do |row|


#add addresses in json format
file = File.read(Rails.root.join('db', 'addresses.json'))
data_hash = JSON.parse(file) 


puts "importing addresses... this could take a while ..."
data_hash["addresses"].length.times do |i|
    curr = data_hash["addresses"][i]
    
    randomCountStat = rand(1..100)
    if randomCountStat >= 95
        statusF = 'Inactive'
    else 
        statusF = 'Active'
    end
    typeF = ["Billing", "Billing", "Billing", "Billing", "Billing" "Shipping", "Shipping", "Shipping", "Shipping", "Shipping", "Home", "Business", "Business", "Business", "Business", "Business"].sample
    if typeF == "Home"
        entityF = "Customer"
    else
        entityF = "Building"
    end
    notesF = Faker::Lorem.sentence(word_count: 4, supplemental: true, random_words_to_add: 5)
    randoSecApp = Faker::Address.secondary_address

    fake_address = Address.new
    fake_address.type_of_address = typeF
    fake_address.status = statusF
    fake_address.entity = entityF
    fake_address.number_and_street = curr["address1"]
    
    fake_address.latitude = curr["coordinates"]["lat"]
    
    fake_address.longitude = curr["coordinates"]["lng"]
    fake_address.state = curr["state"]
    fake_address.suite_or_apartment = randoSecApp
    fake_address.city = curr["city"]
    fake_address.postal_code = curr["postalCode"]
    fake_address.country = "US"
    fake_address.notes = notesF 
    fake_address.save
    nameF = Faker::Name.name
    unique_businessF = Faker::Company.name
    phoneF = Faker::PhoneNumber.phone_number
    emailF = Faker::Internet.email
    yearF = rand(2017..2020)
    monthF = rand(1..12)
    if monthF == 2
        dayF = rand(1..28)
    else
        dayF = rand(1..30)
    end
    c = Date.new(yearF, monthF, dayF)
    c.strftime("%F")

    fEmail = Faker::Internet.email
    fPass = Faker::Internet.password(min_length: 6)

    fake_user = User.create!(
        email: fEmail,
        password: fPass,
        password_confirmation: fPass,
    )

    fake_customer = Customer.create!(
        user_id: fake_user.id,
        customer_create_date: c,
        company_name: unique_businessF,
        address_id: fake_address.id,
        full_name_company_contact: nameF,
        company_contact_phone: phoneF,
        company_contact_email: emailF,
        company_description: notesF,
        full_name_STA: bob.first_name+ " " + bob.last_name,
        phone_TA: phoneF,
        email_TA: emailF,

        #created_at: c,
        #updated_at: c
    )
    
    fake_building = Building.create!(
        customer_id: fake_customer.id,
        address_id: fake_address.id,
        admin_full_name: nameF,
        admin_email: emailF,
        admin_phone: phoneF,
        full_name_STA: bob.first_name+" " +bob.last_name,
        phone_TA: phoneF,
        email_TA: emailF,
    )
    if typeF == "Home"
        BuildingDetail.create!(
            building_id: fake_building.id,
            info_key: "Type",
            value: "Residential"
        )
        next
    else
        buildingtypeF = ["Residential", "Commercial", "Corporate", "Hybrid"].sample
        BuildingDetail.create!(
            building_id: fake_building.id,
            info_key: "Type",
            value: buildingtypeF
        )
        certificateF = Faker::IDNumber.valid
        notesF = Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 3)
        
        counterRandom = rand(1..8)
        case counterRandom
        when 1
            currentEmployee = bob
        when 2
            currentEmployee = nicolas1
        when 3
            currentEmployee = nadya1
        when 4
            currentEmployee = martin1
        when 5
            currentEmployee = mathieuH1
        when 6
            currentEmployee = david1
        when 7
            currentEmployee = mathieuL1
        when 8
            currentEmployee = thomas1
        end
        fake_batteries = Battery.create!(
            building_id: fake_building.id,
            battery_type: buildingtypeF,
            status: statusF,
            employee_id: currentEmployee.id,
            commission_date: c,
            date_of_last_inspect: c,
            certificate_of_operations: certificateF,
            informations: notesF,
            notes: notesF,
            created_at: c,
            updated_at: c
        )
        floorsF = rand(2..40)
        rand(1..5).times do |n|
            fake_column = Column.create!(
                battery_id: fake_batteries.id,
                column_type: buildingtypeF,
                number_of_floors: floorsF,
                status: statusF,
                informations: notesF,
                notes: notesF
            )
            rand(1..6).times do |n|
                certificateF = Faker::IDNumber.valid
                randomCount = rand(1..100)
                if statusF == "inactive"
                    statuss = "Inactive"
                else
                    if randomCount >= 98 
                        statuss = "Inactive"
                    elsif randomCount >= 96 && randomCount <= 98
                        statuss = "Intervention"
                    else
                        statuss = "Active"
                    end
                end
                Elevator.create!(
                    column_id: fake_column.id,
                    serial_number: Faker::IDNumber.south_african_id_number,
                    model: ["Standard", "Premium", "Excelium"].sample,
                    elevator_type: buildingtypeF,
                    status: statuss,
                    commission_date: c,
                    date_of_last_inspection: c,
                    certificate_of_inspection: certificateF,
                    informations: notesF,
                    notes: notesF,
                    created_at: c
                )
            end
        end
    end
end