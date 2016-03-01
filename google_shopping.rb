#RUBY!! no more semi-colons... ever.

require 'json'
file = File.read("./products.json")

#Welcome to RUBY we use snake case now
#snake case word_word not camel case wordWord
google_data = JSON.parse(file)
items = google_data["items"]


#outputs the full object
puts google_data.inspect
puts "------"
#outputs the first item's title
puts google_data["items"][0]["product"]["title"]
puts "------ Question 1"

# 1.) The kind of results you're are dealing are shopping#products. Go through
# the items and find all results that have kind of shopping#product. How many
# are there? Where else is this count information stored in the search
# results?

kinds = 0
items.each do |items|
    if items["kind"].index("shopping#product")
      puts items["product"]["title"]
      kinds += 1
    end
end

puts "------ Question 2"

# 2.) Find all items with a `backorder` availability in `inventories`.

backorder = 0
items.each do |items|
  available = items["product"]["inventories"][0]["availability"]
  title = items["product"]["title"]
  if available.index("backorder")
    puts title + " is on backorder."
    backorder += 1
  end
end

puts "------ Question 3"

# 3.) Find all items with more than one image link.

multiple_photos = 0
items.each do |items|
  image = items["product"]["images"]
  title = items["product"]["title"]
  if image.length > 1
    puts title + " has multiple image links."
    multiple_photos += 1
  end
end

puts "------ Question 4"

# 4.) Find all `canon` products in the items (careful with case sensitivity).

canon_products = 0
items.each do |items|
    brand = items["product"]["brand"]
    title = items["product"]["title"]
    if brand.downcase.include?("canon")
      puts title + " is a canon product."
      canon_products += 1
    end
end

puts "------ Question 5"

# 5.) Find all `items` that have **product** **author** **name** of "eBay" and are brand "Canon".

ebay_canon = 0
items.each do |items|
    author = items["product"]["author"]["name"]
    brand = items["product"]["brand"]
    title = items["product"]["title"]
    if brand.downcase.include?("canon")
      if author.downcase.include?("ebay")
        puts title + " is a canon product authored by ebay."
        ebay_canon += 1
      end
    end
end

puts "------ Question 6"

# 6.) Print all the products with their **brand**, **price**, and a **image link**

items.each do |items|
  brand = items["product"]["brand"]
  title = items["product"]["title"]
  price = items["product"]["inventories"][0]["price"]
  image = items["product"]["images"][0]["link"]
  puts title + " is brand " + brand + " with price " + price.to_s + ". Image link: " + image
  puts "---"
end
