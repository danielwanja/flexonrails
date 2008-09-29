class CreateMovements < ActiveRecord::Migration
  def self.up
    create_table :movements do |t|
      t.float :price
      t.datetime :date
      t.integer :quantity
      t.integer :position_id
      t.string :operation

      t.timestamps
    end
  end

  def self.down
    drop_table :movements
  end
end
