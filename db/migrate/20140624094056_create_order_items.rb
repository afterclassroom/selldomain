class CreateOrderItems < ActiveRecord::Migration
	def change
		create_table :order_items do |t|
			t.integer :productid
			t.integer :quantity, :default => 1
			t.string :riid
			t.float :duration, :default => 1.0
			t.timestamps
		end
	end
end
