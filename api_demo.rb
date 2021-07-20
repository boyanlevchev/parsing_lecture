require 'json'
require 'open-uri'

# TODO - Let's fetch name and bio from a given GitHub username
url = 'https://api.github.com/users/ssaunier'

# I recommend printing out each thing to see what is spit out!

# We use the open-uri library to open a url and retrieve the data it provides
# In this case, the github API is giving us a JSON
# So URI.open will give us a "stringified" JSON
serialized_user = URI.open(url).read
# p serialized_user

# We use JSON.parse to turn the JSON string into a useable Ruby Hash
user = JSON.parse(serialized_user)
# p user

# We access items inside of user like we would any other hash
# p user["name"]
