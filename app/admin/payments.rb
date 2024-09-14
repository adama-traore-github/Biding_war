ActiveAdmin.register Payment do
  # Ajoute des filtres pour buyer et seller
  scope :all, default: true

  
  filter :buyer, as: :select, collection: User.all.collect { |u| [u.name, u.id] }
  filter :seller, as: :select, collection: User.all.collect { |u| [u.name, u.id] }
  filter :product
  filter :amount
  filter :status

  index do
    selectable_column
    id_column
    column :product
    column :buyer
    column :seller
    column :amount
    column :status
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :product, as: :select, collection: Product.all.collect { |i| [i.title, i.id] }
      f.input :buyer, as: :select, collection: User.all.collect { |u| [u.name, u.id] }
      f.input :seller, as: :select, collection: User.all.collect { |u| [u.name, u.id] }
      f.input :amount
      f.input :status, as: :select, collection: ['pending', 'completed', 'refunded']
    end
    f.actions
  end
end


class Payment < ApplicationRecord

  # ...

  def self.ransackable_attributes(auth_object = nil)
    ["amount", "created_at", "id", "payment_date", "payment_method", "product_id", "status", "updated_at", "user_id"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["product", "user"]
  end

  # ...

end