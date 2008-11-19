class CreateOutlinePoints < ActiveRecord::Migration
  def self.up
    create_table :outline_points do |t|
      t.string :label
      t.integer :lft
      t.integer :rgt
      t.integer :parent_id

      t.timestamps
    end
  end

  def self.down
    drop_table :outline_points
  end
end
