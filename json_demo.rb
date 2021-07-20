require 'json'

# TODO - let's read/write data from beers.json
filepath = 'data/beers.json'

# File.read gives us the JSON (hash) as a string
serialized_beers = File.read(filepath)
# p serialized_beers # try print it out to see!

# We JSON.parse the JSON-string to make it a useable Ruby hash!
beers = JSON.parse(serialized_beers)

# We can access our beers hash like so
# Keep in mind when you must use a key (hashes {}) and an index (arrays [])
# beers["beers"][2]["name"] = "Stella"

# filtered_beers = []
beers['beers'].each do |beer|
  # filtered_beers << beer['origin']
  p beer['name'] # Print out all names of beers
end

# filtered_beers.uniq.sort.each do |beer|
#   p beer
# end

# We have a beers hash that we would like to store to a JSON file
beers = {
  beers: [
    {
      name:       'Edelweiss',
      appearance: 'White',
      origin:     'Austria'
    },
    {
      name:       'Guinness',
      appearance: 'Stout',
      origin:     'Ireland'
    }
  ]
}

# We use File.open to access the .json file, and then we write our beer hash to it
# Taking care to first generate a stringified version!
File.open(filepath, 'wb') do |file|
  file.write(JSON.generate(beers))
end
