require 'rubygems'
require 'nokogiri'
require 'open-uri'

@deputes_prenom = Array.new 
@deputes_nom = Array.new 

def get_name_list
  page = Nokogiri::HTML(URI.open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
  prenoms = page.css("li").each{|name| @deputes_prenom << name.text.delete("\t\n").split}
  32.times do @deputes_prenom.delete_at(0) end
  @deputes_prenom.delete_if {|a| a == []}
  @deputes_nom << @deputes_prenom.map{|row| row[2] }
  @deputes_prenom.map!{|row| row[1] }
end

def get_url_list
  page = Nokogiri::HTML(URI.open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))

end

get_name_list
print @deputes_prenom
print @deputes_nom