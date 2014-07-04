class CreateContactInfos < ActiveRecord::Migration
	def change
		create_table :contact_infos do |t|
			t.string :fname
			t.string :lname
			t.string :org
			t.string :email
			t.string :sa1
			t.string :sa2
			t.string :city
			t.string :sp
			t.string :pc
			t.string :cc
			t.string :phone
			t.string :fax
			t.timestamps
		end
	end
end