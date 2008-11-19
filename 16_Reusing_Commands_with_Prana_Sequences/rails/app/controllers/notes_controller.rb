class NotesController < ApplicationController
  
  before_filter :login_required
  
  # return all Notes
  def find_all
    respond_to do |format|
      format.amf  { render :amf => self.current_user.notes.all }
    end
  end
  
  # return a single Note by id
  def find_by_id
    respond_to do |format|
      format.amf { render :amf => self.current_user.notes.find(params[:id]) }
    end
  end

  # saves new or updates existing Note
  def save
    respond_to do |format|
      format.amf do
        @note = params[:note]
        
        if @note.save
          render :amf => @note
        else
          render :amf => FaultObject.new(@note.errors.full_messages.join('\n'))
        end
      end
    end
  end

  # destroy a Note
  def destroy
    respond_to do |format|
      format.amf do
        @note = self.current_user.notes.find(params[:id])
        @note.destroy if @note

        render :amf => true
      end
    end
  end
  
end
