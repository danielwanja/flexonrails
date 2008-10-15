class TasksController < ApplicationController
  
  before_filter :find_context
  
  def load_all
    @tasks = @context.tasks
    
    respond_to do |format|
      format.amf { render :amf => @tasks }
    end
  end
  
  def save
    respond_to do |format|
      format.amf do
        if params[:task].save
          render :amf => params[:task]
        else
          render :amf => FaultObject.new(params[:task].errors.join("\n"))
        end
      end
    end
  end
  
  def destroy
    @task = @context.tasks.find params[:id]
    @task.destroy
    
    respond_to do |format|
      format.amf { render :amf => true }
    end
  end
  
 protected
  
  def find_context
    @context = Context.find params[:context_id]
  end
  
end
