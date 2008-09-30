class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.integer :size
      t.integer :content_type
      t.string :filename
      t.integer :height
      t.integer :width
      t.integer :parent_id
      t.string :thumbnail

      t.timestamps
    end
  end

  def self.down
    drop_table :assets
  end
end
