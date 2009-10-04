class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string :title
      t.text :contents
      t.date :date
      t.time :time
      t.boolean :complete

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
