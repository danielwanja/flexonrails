class OutlinePointsController < ApplicationController
  
  def find_root
    respond_to do |format|
      format.amf  { render :amf => OutlinePoint.roots.first }
    end
  end
  
  # return all OutlinePoints
  def find_all
    respond_to do |format|
      format.amf  { render :amf => OutlinePoint.find(:all) }
    end
  end
  
  # return a single OutlinePoint by id
  def find_by_id
    respond_to do |format|
      format.amf { render :amf => OutlinePoint.find(params[:outline_point]) }
    end
  end

  # saves new or updates existing OutlinePoint
  def save
    respond_to do |format|
      format.amf do
        @outline_point = params[:outline_point]
        @parent_point = OutlinePoint.find params[:parent_id] rescue nil

        if @outline_point.save
          @outline_point.move_to_child_of @parent_point if @parent_point
          render :amf => @outline_point
        else
          render :amf => FaultObject.new(@outline_point.errors.full_messages.join('\n'))
        end
      end
    end
  end

  # destroy a OutlinePoint
  def destroy
    respond_to do |format|
      format.amf do
        @outline_point = OutlinePoint.find(params[:id])
        @outline_point.destroy

        render :amf => true
      end
    end
  end

end
