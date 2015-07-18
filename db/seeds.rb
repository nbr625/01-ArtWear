# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Product.delete_all
Product.create! id: 1, name: "Tentacle Madness", creator: "Nicolas Berrizbeitia", description: "Best redition of the absurd."

Subproduct.delete_all
Subproduct.create! product_id: 1, id: 1, quantity: 20, size: "Small", price: 19.99, active: true
Subproduct.create! product_id: 1, id: 2, quantity: 30, size: "Medium", price: 19.99, active: true
Subproduct.create! product_id: 1, id: 3, quantity: 15, size: "Large", price: 24.99, active: true

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"
