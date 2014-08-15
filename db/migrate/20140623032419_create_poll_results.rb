class CreatePollResults < ActiveRecord::Migration
  def change
    create_table :poll_results do |t|
      t.string :orderid
      t.string :roid
      t.string :riid
      t.string :resourceid
      t.string :status
      t.string :timestamp

      t.timestamps
    end
  end
end
