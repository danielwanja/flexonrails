class Position < ActiveRecord::Base
  belongs_to :account
  has_many :movements, :dependent => :destroy

  validates_uniqueness_of :ticker, :scope => :account_id
  validates_presence_of :name, :message => "Stock not found on Yahoo Finance."
  before_validation_on_create :update_stock_information

  def buy(quantity) 
    self.quantity ||= 0
    self.quantity = self.quantity + quantity;
    movements.build(:quantity => quantity, :price => quote.lastTrade, :operation => 'buy') 
    save
  end

  def sell(quantity)
    self.quantity = self.quantity - quantity
    movements.build(:quantity => quantity, :price => quote.lastTrade, :operation => 'sell')
    save
  end

  protected

  def quote
    @quote ||= YahooFinance::get_standard_quotes(ticker)[ticker]
  end

  def update_stock_information
    self.name = @quote.name if quote.valid?
  end

end
