class CreatePurchaseOrders < ActiveRecord::Migration
  def change
    create_table :purchase_orders do |t|
      t.string :user_id
      t.string :dbpuser_id
      t.string :orderid
      t.string :domain

      t.timestamps
    end
  end
end
