# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Dish.destroy_all
Host.destroy_all
Dinner.destroy_all

def make_seeds
  make_dishes
  make_hosts
  make_dinners
end


def make_hosts
  Host.create(user_id: User.all.first.id)
end

def make_dinners
  Dinner.create(date: Date.parse("November 2, 2015"), host_id: Host.all.first.id)
end

def make_dishes
  Dish.create(name: "Lasagna", course: "Main Dish")
  Dish.create(name: "Chicken", course: "Main Dish")
  Dish.create(name: "Brisket", course: "Main Dish")
  Dish.create(name: "Pot Pie", course: "Main Dish")
  Dish.create(name: "Pulled Pork", course: "Main Dish")
  Dish.create(name: "Green Salad", course: "Salad")
  Dish.create(name: "Pasta Salad", course: "Salad")
  Dish.create(name: "Chips and Salsa", course: "Appetizer")
  Dish.create(name: "Hummus and Vegetables", course: "Appetizer")
  Dish.create(name: "Spinach Dip", course: "Appetizer")
  Dish.create(name: "Brownies", course: "Dessert")
  Dish.create(name: "Chocolate Chip Cookies", course: "Dessert")
end

make_seeds