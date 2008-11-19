class TestServiceController < ApplicationController
  
  before_filter :login_required
  
  def test
    
    respond_to do |format|
      format.amf { render :amf => true }
    end
    
  end

end
