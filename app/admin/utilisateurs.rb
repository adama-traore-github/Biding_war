ActiveAdmin.register Utilisateur do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :email
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :email]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
class Utilisateur < ApplicationRecord

  # ...

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "id", "name", "updated_at"]
  end

  # ...

end