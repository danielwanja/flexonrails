class ContactsController < ApplicationController
  
  # return all Contacts
  def find_all
    respond_to do |format|
      format.amf  { render :amf => Contact.find(:all) }
    end
  end
  
  # return a single Contact by id
  # expects id in params[0]
  def find_by_id
    respond_to do |format|
      format.amf { render :amf => Contact.find(params[0]) }
    end
  end

  # saves new or updates existing Contact
  # expect params[0] to be incoming Contact
  def save
    respond_to do |format|
      format.amf do
        @contact = params[0]

        if @contact.save
          render :amf => @contact
        else
          render :amf => FaultObject.new(@contact.errors.full_messages.join('\n'))
        end
      end
    end
  end

  # destroy a Contact
  # expects id in params[0]
  def destroy
    respond_to do |format|
      format.amf do
        @contact = Contact.find(params[0])
        @contact.destroy

        render :amf => true
      end
    end
  end

end
