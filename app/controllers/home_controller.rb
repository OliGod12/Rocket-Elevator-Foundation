class HomeController < ApplicationController
  def index
  end
  
  def residential
  end

  def corporate
  end

  def quote
  end


  def create
    buildingType = params[:tipe]
    
    if buildingType == "residential"
      Quote.create(
        Product_Quality: params[:price],
        Building_Type: params[:tipe],
        Nb_Appartement: params[:numDoor],
        Nb_Floor: params[:numFloor],
        Nb_Basement: params[:numBasement],
        Price_Per_Ele: params[:pricePerElevator],
        Subtotal: params[:finalPriceElevator],
        Nb_Ele_Suggested: params[:finalNumberElevator],
        Install_Fee: params[:finalInstalationFee],
        Final_Price: params[:finalTotalPrice],
        Full_Name: params[:fullName],
        Phone_Number: params[:phoneNumber],
        Company_Name: params[:comName],
        Email: params[:email]
       )






    elsif buildingType == "commercial"
        puts "commercial"
      Quote.create(
        Product_Quality: params[:price],
        Building_Type: params[:tipe],
        Nb_Business: params[:numDoor],
        Nb_Floor: params[:numFloor],
        Nb_Basement: params[:numBasement],
        Nb_Parking: params[:numParking],
        Nb_Cage: params[:numDemand],
        Price_Per_Ele: params[:pricePerElevator],
        Subtotal: params[:finalPriceElevator],
        Nb_Ele_Suggested: params[:finalNumberElevator],
        Install_Fee: params[:finalInstalationFee],
        Final_Price: params[:finalTotalPrice],
        Full_Name: params[:fullName],
        Phone_Number: params[:phoneNumber],
        Company_Name: params[:comName],
        Email: params[:email]
       )
    elsif buildingType == "corporate"
      puts "corporate"
      Quote.create(
        Product_Quality: params[:price],
        Building_Type: params[:tipe],
        Nb_Company: params[:numDoor],
        Nb_Floor: params[:numFloor],
        Nb_Basement: params[:numBasement],
        Nb_Parking: params[:numParking],
        Nb_OccupantPerFloor: params[:numMPF],
        Price_Per_Ele: params[:pricePerElevator],
        Subtotal: params[:finalPriceElevator],
        Nb_Ele_Suggested: params[:finalNumberElevator],
        Install_Fee: params[:finalInstalationFee],
        Final_Price: params[:finalTotalPrice],
        Full_Name: params[:fullName],
        Phone_Number: params[:phoneNumber],
        Company_Name: params[:comName],
        Email: params[:email]
       )
    else
      puts "hybrid"
      Quote.create(
        Product_Quality: params[:price],
        Building_Type: params[:tipe],
        Nb_Business: params[:numDoor],
        Nb_Floor: params[:numFloor],
        Nb_Basement: params[:numBasement],
        Nb_Parking: params[:numParking],
        Nb_OccupantPerFloor: params[:numMPF],
        Nb_OperatingHour: params[:numActiveHour],
        Price_Per_Ele: params[:pricePerElevator],
        Subtotal: params[:finalPriceElevator],
        Nb_Ele_Suggested: params[:finalNumberElevator],
        Install_Fee: params[:finalInstalationFee],
        Final_Price: params[:finalTotalPrice],
        Full_Name: params[:fullName],
        Phone_Number: params[:phoneNumber],
        Company_Name: params[:comName],
        Email: params[:email]
       )
    end
    ZendeskAPI::Ticket.create!($client, :type => "task", :subject => "#{params[:fullName]} from #{params[:comName]}", :comment => { :value => "
      The contact #{params[:fullName]} from company #{params[:comName]} can be reached at email  #{params[:email]} and at 
      phone number #{params[:phoneNumber]}. #{params[:fullName]} want a total of #{params[:finalNumberElevator]} #{params[:price]} elevators. 
      The subtotal is: #{params[:finalPriceElevator]}, instalation fee is: #{params[:finalInstalationFee]} and the total quote price is: #{params[:finalTotalPrice]}" }, :priority => "urgent") 
    redirect_to "/thankyou"

  end


end
