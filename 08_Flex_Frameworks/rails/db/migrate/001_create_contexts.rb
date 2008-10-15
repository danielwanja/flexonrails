class CreateContexts < ActiveRecord::Migration
  def self.up
    create_table :contexts do |t|
      t.string :label

      t.timestamps
    end
  end

  def self.down
    drop_table :contexts
  end
end
