class Category < ActiveRecord::Base
  belongs_to :parent, :class_name => "Category"
  acts_as_nested_set     
                             
  def full_xml(builder=nil)
    xml = builder ||= Builder::XmlMarkup.new(:indent => 2)
    xml.category(:id => id, 
                 :name => name, 
                 :description => description, 
                 :qty_in_stock => qty_in_stock) do
      children.each { |child| child.full_xml(xml) }
    end
  end 
  
end