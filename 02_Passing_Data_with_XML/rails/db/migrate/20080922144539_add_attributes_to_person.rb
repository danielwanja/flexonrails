class AddAttributesToPerson < ActiveRecord::Migration
  def self.up
    add_column :people, :bio, :text
    add_column :people, :net_worth, :float
    add_column :people, :number_of_ipods, :integer
    add_column :people, :birthday, :date
    add_column :people, :birthday_and_time, :datetime
    add_column :people, :rails_programmer, :boolean
    add_column :people, :flex_programmer, :boolean
  end

  def self.down
    remove_column :people, :flex_programmer
    remove_column :people, :rails_programmer
    remove_column :people, :birthday_and_time
    remove_column :people, :birthday
    remove_column :people, :number_of_ipods
    remove_column :people, :net_worth
    remove_column :people, :bio
  end
end
