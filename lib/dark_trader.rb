require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'mechanize'  
# Ouverture de la page via Nokogiri
#page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

# Méthode pour chercher la liste de symbole de crypto et les intégrer dans le tableau symbol_list_array 
def crypto_symbol_list 
  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
  symbol_list = page.xpath('//td[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__symbol"]')
  symbol_list_array = Array.new 
  symbol_list.each do |symbol|
    symbol_list_array << symbol.text
  end
  return symbol_list_array
end

# Méthode pour la liste des valeurs de crypto et les intégrer dans le tableau price_list_array 
def crypto_price_list
  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
  price_list = page.xpath('//td[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price"]')
  price_list_array = []
  price_list.each do |price|
    price_list_array << price.text.delete("$,").to_f
  end
  return price_list_array
end
# Méthode pour combiner en hash et mettre un peu en forme tout ça
def perform
  listedefsymbole = crypto_symbol_list
  listedefprice = crypto_price_list
  hash = Hash[listedefsymbole.zip(listedefprice)].each_slice(1).map(&:to_h) 
  puts hash.count
end

perform


