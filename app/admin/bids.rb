ActiveAdmin.register Bid do
  permit_params :amount, :user_id, :item_id

  index do
    selectable_column
    id_column
    column :amount
    column :user
    column :item
    column :created_at
    actions
  end

  filter :amount
  filter :user
  filter :item
  filter :created_at

  form do |f|
    f.inputs do
      f.input :amount, min: 0
      f.input :user, as: :select, collection: User.all.collect {|u| [u.name, u.id]}
      f.input :product, as: :select, collection: Product.all.collect {|i| [i.title, i.id]}
    end
    f.actions
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :amount, :bid_date, :user_id, :product_id, :end_time, :image_url, :finalized_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:amount, :bid_date, :user_id, :product_id, :end_time, :image_url, :finalized_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
class Bid < ApplicationRecord

  # ...

  def self.ransackable_attributes(auth_object = nil)
    ["amount", "bid_date", "created_at", "end_time", "finalized_at", "id", "image_url", "product_id", "updated_at", "user_id"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["bids", "product", "user"]
  end

  # ...

end