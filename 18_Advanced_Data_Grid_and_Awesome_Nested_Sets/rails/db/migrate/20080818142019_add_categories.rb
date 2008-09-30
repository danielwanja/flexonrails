class AddCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|           
      t.string  :name
      t.text    :description
      t.integer :parent_id, :lft, :rgt, :qty_in_stock
      t.timestamps
    end
  end

  def self.down
    drop_table :categories
  end
end
