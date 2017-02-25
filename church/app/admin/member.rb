ActiveAdmin.register Member do

  form title: 'A custom title' do |f|
     inputs 'Details' do
       input :first_name
       input :last_name
       li "Created at #{f.object.created_at}" unless f.object.new_record?
     end
     para "Press cancel to return to the list without saving."
     actions
   end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
