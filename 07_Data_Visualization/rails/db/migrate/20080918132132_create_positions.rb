class CreatePositions < ActiveRecord::Migration
  def self.up
    create_table :positions do |t|
      t.integer :account_id
      t.integer :quantity
      t.string :ticker
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :positions
  end
end
