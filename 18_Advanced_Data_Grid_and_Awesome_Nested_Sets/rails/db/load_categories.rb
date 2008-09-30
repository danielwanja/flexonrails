Category.transaction do
  root = Category.create(:name => "Main Category")

  cameras = Category.create(:name => "Cameras & Photo")
  cameras.move_to_child_of(root)
  Category.create(:name => "Bags", 
                  :qty_in_stock => 2).move_to_child_of(cameras)
  Category.create(:name => "Accessories",
                  :qty_in_stock => 12).move_to_child_of(cameras)
  Category.create(:name => "Analog Cameras",
                  :qty_in_stock => 0).move_to_child_of(cameras)
  Category.create(:name => "Digital Cameras",
                  :qty_in_stock => 5).move_to_child_of(cameras)

  phones = Category.create(:name => "Cell Phones")
  phones.move_to_child_of(root) 
  Category.create(:name => "Accessories", 
                  :qty_in_stock => 8).move_to_child_of(phones)
  Category.create(:name => "Phones", 
                  :qty_in_stock => 20).move_to_child_of(phones)
  Category.create(:name => "Prepaid Cards", 
                  :qty_in_stock => 3).move_to_child_of(phones)

  dvds = Category.create(:name => "Dvds")
  dvds.move_to_child_of(root) 
  Category.create(:name => "Blueray", 
                  :qty_in_stock => 10).move_to_child_of(dvds)
  Category.create(:name => "HD DVD", 
                  :qty_in_stock => 0).move_to_child_of(dvds)
  Category.create(:name => "DVD", 
                  :qty_in_stock => 100).move_to_child_of(dvds)

end
