class ContextsController < ApplicationController
  
  def load_all
    @contexts = Context.find :all
    
    respond_to do |format|
      format.amf { render :amf => @contexts }
    end
  end
  
  def save
    respond_to do |format|
      format.amf do
        if params[:context].save
          render :amf => params[:context]
        else
          render :amf => FaultObject.new(params[:context].errors.join("\n"))
        end
      end
    end
  end
  
  def destroy
    @context = Context.find params[:id]
    @context.destroy
    
    respond_to do |format|
      format.amf do
        render :amf => true
      end
    end
  end
  
end
