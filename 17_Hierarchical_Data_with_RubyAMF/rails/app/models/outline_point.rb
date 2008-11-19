class OutlinePoint < ActiveRecord::Base

  belongs_to :parent, :class_name => "OutlinePoint"
  
  acts_as_nested_set
  
end
