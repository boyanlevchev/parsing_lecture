require 'open-uri'
require 'nokogiri'

# Let's scrape recipes from http://www.epicurious.com

# We create a simple interfac that will ask a user for an ingredient
# Hint: pick chocolate
puts 'Pick an ingredient'
print '>'
ingredient = gets.chomp # We store the user input into a variable ingredient

url = "https://www.epicurious.com/search/#{ingredient}" # we interpolate ingredient into a url

# Try to access https://www.epicurious.com/search/chocolate in your web browser
# And you will see what Nokogiri will see

# We load in the url to read it with Ruby
html_file = URI.open(url).read
# Then we parse the url file with Nokogiri so we can run methods against it
html_doc = Nokogiri::HTML(html_file)

# We search through the HTML document, with methods provided by Nokogiri
# In this case we search by using the class of one of the recipe cards
# https://www.epicurious.com/search/chocolate
# Open up the above link, and inspect the page - hover over the first card
# And see what class it has - should be '.view-complete-item'
# So we add this class as our 'search term' below
html_doc.search('.view-complete-item').each do |element|
  # As we cycle over each element with class .view-complete-item we print out the url they all point to
  # Why do they all have urls?
  # They are all a tags!
  puts element.attribute('href').value
end
