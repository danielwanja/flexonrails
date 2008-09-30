class MessengerController < ApplicationController
  def message
    data = {:user => params[:user], :message => params[:message]}
    Juggernaut.send_to_channel(data, :im_channel)
    render :nothing => true
  end
end
