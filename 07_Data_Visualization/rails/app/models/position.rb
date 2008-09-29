class Position < ActiveRecord::Base
  belongs_to :account
  has_many :movements, :dependent => :destroy

  validates_uniqueness_of :ticker, :scope => :account_id
  validates_presence_of :name, 
                        :message => "Stock not found on Yahoo Finance."
  before_validation_on_create :update_stock_information

  def buy(quantity) 
    self.quantity ||= 0
    self.quantity = self.quantity + quantity;
    movements.build(:quantity => quantity, :price => quote.lastTrade,
                    :operation => 'buy')
    save
  end

  def sell(quantity)
    self.quantity = self.quantity - quantity
    movements.build(:quantity => quantity, :price => quote.lastTrade,
                    :operation => 'sell')
    save
  end

  # NEW: expose account_name to be included in XML.
  def account_name
    account.name
  end

  # NEW: expose last_price to be included in XML.
  def last_price
    quote.lastTrade
  end
  
  # NEW: expose estimate_total to be included in XML.
  def estimated_total
    quantity * last_price
  end
  
  # NEW: provides historical price information.
  def history
    items = YahooFinance::get_historical_quotes_days( ticker, 200 )
    items.reverse!
    items.each_with_index do |item, index|
      hash = {}
      %w{date open high low close volume adjusted_close}.each_with_index do |field, position|
        hash[field] = item[position]
      end
      items[index] = hash
    end
  end
  
  # NEW: included last_price, estimated_total, and account_name with XML.
  def to_xml(options = {})
    super(options.merge({:methods => [:last_price, :estimated_total, :account_name]}))
  end  


  protected

  def quote
    @quote ||= YahooFinance::get_standard_quotes(ticker)[ticker]
  end

  # NEW: extended_quote contains additonal attributes such as stock_exchange.
  def extended_quote
    @extended_quote ||= YahooFinance::get_extended_quotes(ticker)[ticker]
    @extended_quote 
  end
  
  # NEW: updated implementation to included stock_exchange and determined sector and industry
  def update_stock_information
    if @quote.valid? #Using name to ensure YahooFinance returned information
      self.name = @quote.name 
      self.stock_exchange = extended_quote.stockExchange
      self.sector, self.industry = YahooSearch.get_sector_industry(ticker)
    end
  end

end
