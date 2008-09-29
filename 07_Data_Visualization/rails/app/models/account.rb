class Account < ActiveRecord::Base
  has_many :positions, :dependent => :destroy

  def buy(ticker, quantity)
    ticker.upcase!
    position = positions.find_or_initialize_by_ticker(ticker)
    position.buy(quantity)
    position.save
    position
  end

end
