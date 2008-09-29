# NEW: adding addtional attribute to use by OLAP cube.
class AddAttributesToPosition < ActiveRecord::Migration
  def self.up
    add_column :positions, :sector, :string
    add_column :positions, :industry, :string
    add_column :positions, :stock_exchange, :string
  end

  def self.down
    remove_column :positions, :stock_exchange
    remove_column :positions, :industry
    remove_column :positions, :sector
  end
end
