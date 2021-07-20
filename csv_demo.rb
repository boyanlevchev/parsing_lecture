require 'csv'

# TODO - let's read/write data from beers.csv
filepath    = 'data/beers.csv'


# We start with an empty beer array
# We will store our beer data from our beers.csv "database"
beers = [

]

# Parsing CSV
csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }

# row_count = 0
CSV.foreach(filepath, csv_options) do |row|
  # These commented out lines would allow us to skip the header row
  # But we can use a special CSV option instead!
  # unless row_count == 0
  # end
  # row_count += 1
  beers << row
end

# Storing CSV
csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }

CSV.open(filepath, 'wb', csv_options) do |csv|
  csv << ["name", "appearance", "origin"] # We make sure the headers are maintained in our CSV, by rewriting them
  beers << ["Guinness", "Stout", "Ireland"] # We add a new beer to our beers array - try adding your own!
  beers.each do |beer| # We then loop over our beers array and for each beer, store in the CSV
    csv << beer
  end
end
