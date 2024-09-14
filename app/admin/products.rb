ActiveAdmin.register Product do
  permit_params :title, :description, :starting_price, :category, :auction_end_date, :user_id

  index do
    selectable_column
    id_column
    column :title
    column :starting_price
    column :category
    column :auction_end_date
    column :user
    actions
  end
  
  filter :title
  filter :category
  filter :starting_price
  filter :user
  filter :auction_end_date

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :starting_price
      f.input :category
      f.input :auction_end_date, as: :datepicker
      f.input :user, as: :select, collection: User.all.collect {|u| [u.name, u.id]}
    end
    f.actions
  end
end

class Product < ApplicationRecord

  # ...

  def self.ransackable_associations(auth_object = nil)
    ["bids", "category", "image_attachment", "image_blob", "seller"]
  end
  def self.ransackable_attributes(auth_object = nil)
    ["auction_end_date", "auction_start_date", "category", "category_id", "created_at", "description", "id", "image", "initial_price", "name", "seller_id", "updated_at"]
  end

  # ...

end