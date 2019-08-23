# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "mint leaves")

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
json_size = JSON.parse(open(url).read).first[1].count

puts 'Loading new data for Ingredient'
10.times.each do
  i = (1..json_size).to_a.sample
  name = JSON.parse(open(url).read).first[1][i]["strIngredient1"]
  Ingredient.create(name: name)
end

puts 'Loading new data for Cocktail'
some_cocktails = ['Martini', 'Manhattan', 'Bloody Mary', 'Margarita', 'Old Fashioned Cocktail', 'Mojito', 'Daiquiri','Gin and Tonic']
some_cocktails.each do |cocktail|
  Cocktail.create(name: cocktail)
end

puts 'Load of data done!'
