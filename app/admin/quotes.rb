ActiveAdmin.register Quote do
    permit_params :Full_Name, :Phone_Number, :Company_Name, :Email, :Building_Type, :Product_Quality, :Nb_Appartement, :Nb_Business, :Nb_Company, :Nb_Basement, 
    :Nb_Cage, :Nb_Parking, :Nb_OccupantPerFloor, :Nb_OperatingHour, :Nb_Ele_Suggested, :Price_Per_Ele, :Subtotal, :Install_Fee, :Final_Price
    
    index do
      selectable_column
      id_column
      column  :Full_Name
      column  :Phone_Number
      column  :Company_Name
      column  :Email
      column  :Building_Type
      column  :Product_Quality
      column  :Nb_Appartement
      column  :Nb_Business
      column  :Nb_Company
      column  :Nb_Floor
      column  :Nb_Basement
      column  :Nb_Cage
      column  :Nb_Parking
      column  :Nb_OccupantPerFloor
      column  :Nb_OperatingHour
      column  :Nb_Ele_Suggested
      column  :Price_Per_Ele
      column  :Subtotal
      column  :Install_Fee
      column  :Final_Price
      actions
    end
  
    filter :Full_Name
    filter :Building_Type
    filter :Product_Grade
    filter :Final_Price
  end
  