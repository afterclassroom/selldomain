class AddColumnPasswordToPurchaseOrder < ActiveRecord::Migration
  def change
  	add_column :purchase_orders, :password, :string
  end
end
