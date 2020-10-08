require 'rubygems'
require 'nokogiri'
require 'open-uri'
  

page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
crypto_list = []
#puts page.xpath("//tr[1]/td[2]/div/a").each {|n| crypto_list << n.text}
puts page.xpath('//a[contains(@href, "currencies")]')
# puts page.class
# page.search(".cmc-link").map do |element|
#   puts crypto_list < page.inner_text
# end

# sc-1kxikfi-0 fjclfm cmc-table__column-name