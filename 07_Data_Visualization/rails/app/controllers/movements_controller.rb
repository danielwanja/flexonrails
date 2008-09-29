class MovementsController < ApplicationController
  before_filter :get_account_and_position    
  def index
    @movements = @position.movements.find(:all)
    render :xml => @movements.to_xml(:dasherize => false)
  end
  protected
  def get_account_and_position  
    @account = Account.find(params[:account_id])
    @position = @account.positions.find(params[:position_id])
  end

end
