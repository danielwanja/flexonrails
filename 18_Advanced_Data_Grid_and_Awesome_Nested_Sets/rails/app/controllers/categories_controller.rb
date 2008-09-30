class CategoriesController < ApplicationController
  def index
    render :xml => Category.root.full_xml
  end
  
  def create
    parent = Category.find_by_id(params[:category][:parent_id])
    @category = Category.new(params[:category])
    if @category.save    
      @category.move_to_child_of(parent) if parent
      render :xml => Category.root.full_xml, :status => :created
    else
      render :xml => @category.errors
    end
  end

  def update      
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      render :xml => Category.root.full_xml
    else
      render :xml => @category.errors
    end
  end
  
  def destroy
     @category = Category.find(params[:id])
     @category.destroy
     render :xml => Category.root.full_xml
  end

  def move
     parent = Category.find_by_id(params[:category][:parent_id])
     @category = Category.find(params[:category][:id])
     @category.move_to_child_of(parent)
     render :xml => Category.root.full_xml
   end

end