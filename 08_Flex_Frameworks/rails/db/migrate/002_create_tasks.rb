class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :label
      t.integer :context_id
      t.datetime :completed_at

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
