require 'rubygems'
require 'nokogiri'
require 'open-uri'
  
# Ouverture de la page via Nokogiri
#page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))


def crypto_symbol_list 
  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
  symbol_list = page.xpath('//td[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__symbol"]')
  symbol_list_array = Array.new 
  symbol_list.each do |symbol|
    symbol_list_array << symbol.text
  end
  return symbol_list_array
end
def crypto_price_list
  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
  price_list = page.xpath('//td[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price"]')
  price_list_array = []
  price_list.each do |price|
    price_list_array << price.text.delete("$,").to_f
  end
  return price_list_array
end

def perform
  listedefsymbole = crypto_symbol_list
  listedefprice = crypto_price_list
  hash = Hash[listedefsymbole.zip(listedefprice)].each_slice(1).map(&:to_h) ### !!!!!
  #puts hash
end

#perform










# news_links = page.select("//a"[@cmc-table__cell--sort-by__name])
# #.select{|link| link['td class'] == "cmc-table__cell cmc-table__cell--sticky cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__name"}
# news_links.each{|link| puts link['href'] }
# puts emails_list.count      


#def test_crypto_hash
# set URL to point to where the page exists
# links = page.xpath('//a[contains(@href, "cell--sort-by__name")]')
# puts links.length   # => 6
# puts links.text   # => Click here
# puts links[0]["href"]
#end


#crypto_list = Hash.new
# emails_list.each do |email_link|
#   puts crypto_list << email_link.text #ou n'importe quelle autre opération
#   end



#emails_list.css("a").select{|link| ["href"] == "/currencies/"}
#emails_list.each{|link| puts link.text}


