# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

coco = Shop.create!(
  name: "CoCo",
  description: "We know how to make it FRESH over 50 original sources worldwide, We know how to TASTE GOOD over 100 menus worldwide, Enjoy the most FABULOUS fresh drinks from Taiwan.",
  address: "41-40 Kissena Blvd Flushing NY 11354",
  phone: "718-358-1835"
)

Beverage.create!(
  shop: coco,
  name: "Assam Milk Tea",
  hot: true,
  cold: true,
  size: "Large",
  description: "Black tea with milk tea.",
  price: 35
)

Beverage.create!(
  shop: coco,
  name: "Assam Milk Tea",
  hot: true,
  cold: true,
  size: "Medium",
  description: "Black tea with milk tea.",
  price: 30
)

Beverage.create!(
  shop: coco,
  name: "Assam Milk Tea",
  hot: true,
  cold: true,
  size: "Small",
  description: "Black tea with milk tea.",
  price: 25
)

Beverage.create!(
  shop: coco,
  name: "Passion Fruit Green Tea",
  hot: true,
  cold: false,
  size: "Large",
  description: "A great combination of passion fruit and green tea.",
  price: 40
)

Beverage.create!(
  shop: coco,
  name: "Passion Fruit Green Tea",
  hot: true,
  cold: false,
  size: "Small",
  description: "A great combination of passion fruit and green tea.",
  price: 20
)


Beverage.create!(
  shop: coco,
  name: "Winter Melon Juice with Buckwheat",
  hot: false,
  cold: true,
  size: "Medium",
  description: "Winter melon are being prepared in traditional recipes and it has the original tastes. Mixed with top Golden Buckwheat.",
  price: 35
)

Beverage.create!(
  shop: coco,
  name: "Mango Smoothie",
  hot: false,
  cold: true,
  size: "Large",
  description: "Mango Smoothie.",
  price: 35
)
