ActiveAdmin.register Address do

  permit_params :street, :street_number, :city, :zip_code

end
