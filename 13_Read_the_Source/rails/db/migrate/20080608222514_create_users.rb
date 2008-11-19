class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :full_name
      t.integer :company_id

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
