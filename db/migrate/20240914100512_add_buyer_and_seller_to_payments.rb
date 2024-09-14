class AddBuyerAndSellerToPayments < ActiveRecord::Migration[6.1]
  def change
    add_column :payments, :buyer_id, :integer
    add_column :payments, :seller_id, :integer
  end
end
