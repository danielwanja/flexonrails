class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :office_phone
      t.integer :home_phone

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
