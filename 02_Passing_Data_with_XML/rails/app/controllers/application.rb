# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # Enable this after_filter when using the HttpServiceToUpdateWithErroHandling.mxml Flex application
  #after_filter :flex_error_handling
  def flex_error_handling
    response.headers['Status'] = interpret_status(200) if response.headers['Status'] == interpret_status(422)
  end
  
  def rescue_action_in_public(exception)
    render_exception(exception)
  end
  def rescue_action_locally(exception)
    render_exception(exception)
  end
  rescue_from ActiveRecord::RecordNotFound, :with => :render_exception
  def render_exception(exception)
    render :text => "<errors><error>#{exception}</error></errors>", :status => 200 
  end


  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '7110fc713be482f69d77aa0f89ea8f6f'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
end
