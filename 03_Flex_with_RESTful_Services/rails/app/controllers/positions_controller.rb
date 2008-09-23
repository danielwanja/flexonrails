class PositionsController < ApplicationController
  before_filter :get_account
  def index
    @positions = @account.positions.find(:all)
    render :xml => @positions.to_xml(:dasherize=>false)
  end

  def create
    @position = @account.positions.find(params[:position][:id])
    if @position.buy(params[:position][:quantity].to_i)
      render :xml => @position, :status => :created, 
             :location => [@account, @position]
    else
      render :xml => @position.errors, :status => :unprocessable_entity
    end
  end

  def destroy
    @position = @account.positions.find(params[:position][:id])
    if @position.sell(params[:position][:quantity].to_i)
      render :xml => @position, :status => :created, 
             :location => [@account, @position]
    else
      render :xml => @position.errors, :status => :unprocessable_entity
    end
  end

   def buy    
    @position = @account.buy(params[:position][:ticker],
                             params[:position][:quantity].to_i)  
    if @position.errors.empty?
      head :ok
    else
      render :xml => @position.errors, :status => :unprocessable_entity
    end
  end


  protected
  def get_account
    @account = Account.find(params[:account_id])
  end

end
