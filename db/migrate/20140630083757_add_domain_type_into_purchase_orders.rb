class AddDomainTypeIntoPurchaseOrders < ActiveRecord::Migration
  def change
  	add_column :purchase_orders, :domain_type, :string
  end
end
