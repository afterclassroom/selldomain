class UpdatePurchaseOrder < ActiveRecord::Migration
  def change
  	add_column :purchase_orders, :contact_info_id, :integer, :default => 0
  	add_column :purchase_orders, :order_item_id, :integer, :default => 0
  end
end
