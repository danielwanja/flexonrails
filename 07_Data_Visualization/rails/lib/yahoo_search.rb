require 'hpricot'
require 'open-uri'
# Daniel Wanja.
# Extracts sector and industry from yahoo finance html page.
class YahooSearch

  # e.g. YahooSearch.get_sector_industry('GOOG')
  def self.get_sector_industry(symbol)
    doc = Hpricot(open("http://finance.yahoo.com/q/in?s=#{symbol}"))
    elements = doc.search("td[@class='yfnc_tabledata1'] > a")
    sector = elements[0].inner_html
    industry = elements[1].inner_html
    return sector, industry
  end

  private 

  #FIXME: could be done in 1 regex.
  def self.tag_value(s, tag)
    start_block = Regexp.new("#{tag}:<\/td>") =~ s
    end_index = s.index('</a>', start_block)
    start_index = s[start_block..end_index].rindex('>')
    value = s[start_block+start_index..end_index]
    value[1..value.length-2]
  end

end