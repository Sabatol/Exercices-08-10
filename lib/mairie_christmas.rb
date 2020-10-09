require 'rubygems'
require 'nokogiri'
require 'open-uri'

@city_list = Array.new 
@city_mail = Array.new 


#Méthode pour obtenir la liste des villes du val d'oise à partir d'un url (open via Nokogiri) et les placer dans city_list
def get_city_list
  page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
  return citys = page.xpath(('//a[@class="lientxt"]')).each{|city| @city_list << city.text.downcase.gsub(" ","-")}
end

#Méthode pour obtenir la liste des emails des villes du val d'oise à partir d'un url (open via Nokogiri), d'un chemin à parcourir... pour enfin les placer dans city_mail
def get_city_email
  @city_list.each do |city|
  page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/95/#{city}.html"))
  mail = page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
  @city_mail << mail
  end
end

#On fusionne les arrays et on met en forme le hash !
def fusion
  hash_final = Hash[*@city_list.zip(@city_mail).flatten]
  return puts hash_final.each_slice(1).map(&:to_h)
end

def perform
  get_city_list
  get_city_email
  fusion
end

perform
