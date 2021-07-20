require 'open-uri'
require 'nokogiri'

# Let's scrape recipes from http://www.epicurious.com

puts "Pick an ingredient"
print ">"
ingredient = gets.chomp

url = "https://www.epicurious.com/search/#{ingredient}"

html_file = URI.open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.search('.view-complete-item').each do |element|
  # puts element.attribute('title').value
  puts element.attribute('href').value
end
