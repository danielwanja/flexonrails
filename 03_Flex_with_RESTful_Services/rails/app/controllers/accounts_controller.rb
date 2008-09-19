class AccountsController < ApplicationController

  def index
    @accounts = Account.find(:all)
    render :xml => @accounts
  end

  def create
    @account = Account.new(params[:account])
    if @account.save
      render :xml => @account, :status => :created, :location => @account
    else
      render :xml => @account.errors, :status => :unprocessable_entity
    end
  end

  def update
    @account = Account.find(params[:id])
    if @account.update_attributes(params[:account])
      head :ok
    else
      render :xml => @account.errors, :status => :unprocessable_entity
    end
  end

  def destroy
    @account = Account.find(params[:id])
    @account.destroy
    head :ok
  end

end
