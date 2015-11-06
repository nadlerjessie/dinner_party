
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
User.destroy_all
Guest.destroy_all
Invitation.destroy_all
DishAssignment.destroy_all
MenuItem.destroy_all


def make_seeds
  make_dishes
  make_users
  # make_guests
  # make_hosts
  # make_dinners
  # make_invitations
  # make_dish_assignments
end

def make_users
  User.create(name: "Tracy 1")
  User.create(name: "Jessie")
  User.create(name: "Hedi")
  User.create(name: "Dan")
end


# def make_hosts
#   Host.create(user_id: User.all.first.id)
#   Host.create(user_id: User.find(2))
# end

# def make_guests
#   Guest.create(user_id:1)
#   Guest.create(user_id:2)
#   Guest.create(user_id:3)
#   Guest.create(user_id:1)
# end

# def make_dinners
#   Dinner.create(date: Date.parse("November 2, 2015"), host_id: 1, title: "Dan's Party")
#   Dinner.create(date: Date.parse("November 3, 2015"), host_id: 1, title: "DANCE PaRTAY")
#   Dinner.create(date: Date.parse("November 4, 2015"), host_id: 1, title: "SOIREE NIGHTTIME")
#   Dinner.create(date: Date.parse("November 5, 2015"), host_id: 1, title: "FEAST")
#   Dinner.create(date: Date.parse("November 6, 2015"), host_id: 1, title: "Eatin Time")
#   Dinner.create(date: Date.parse("November 7, 2015"), host_id: 1, title: "Yum yum in my tum tum")
# end

def make_dishes
  Dish.create(name: "Lasagna", course: "Main Dishes")
  Dish.create(name: "Chicken", course: "Main Dishes")
  Dish.create(name: "Brisket", course: "Main Dishes")
  Dish.create(name: "Pot Pie", course: "Main Dishes")
  Dish.create(name: "Fish", course: "Main Dishes")
  Dish.create(name: "Beef", course: "Main Dishes")
  Dish.create(name: "Spaghetti Squash", course: "Main Dishes")
  Dish.create(name: "Eggplant Parmesean", course: "Main Dishes")
  Dish.create(name: "Pancakes", course: "Main Dishes")
  Dish.create(name: "Risotto", course: "Main Dishes")
  Dish.create(name: "Turkey", course: "Main Dishes")
  Dish.create(name: "Soup", course: "Main Dishes")
  Dish.create(name: "Green Salad", course: "Sides")
  Dish.create(name: "Caprese", course: "Sides")
  Dish.create(name: "Quinoa", course: "Sides")
  Dish.create(name: "Asparagus", course: "Sides")
  Dish.create(name: "Meatballs", course: "Sides")
  Dish.create(name: "Pasta Salad", course: "Sides")
  Dish.create(name: "Fruit Salad", course: "Sides")
  Dish.create(name: "Kale Salad", course: "Sides")
  Dish.create(name: "Mac and Cheese", course: "Sides")
  Dish.create(name: "Cauliflower", course: "Sides")
  Dish.create(name: "Broccoli", course: "Sides")
  Dish.create(name: "Brussels Sprouts", course: "Sides")
  Dish.create(name: "Lentils", course: "Sides")
  Dish.create(name: "Salsa", course: "Appetizers")
  Dish.create(name: "Guacamole", course: "Appetizers")
  Dish.create(name: "Hummus", course: "Appetizers")
  Dish.create(name: "Spinach Dip", course: "Appetizers")
  Dish.create(name: "Kebobs", course: "Appetizers")
  Dish.create(name: "Potatoes", course: "Appetizers")
  Dish.create(name: "Spring Rolls", course: "Appetizers")
  Dish.create(name: "Brownies", course: "Desserts")
  Dish.create(name: "Cinnamon Rolls", course: "Desserts")
  Dish.create(name: "Cake", course: "Desserts")
  Dish.create(name: "Chocolate Chip Cookies", course: "Desserts")
  Dish.create(name: "Banana Bread", course: "Desserts")
  Dish.create(name: "Pumpkin Bread", course: "Desserts")
  Dish.create(name: "Juice", course: "Beverages")
  Dish.create(name: "Soda", course: "Beverages")
  Dish.create(name: "Hot Chocolate", course: "Beverages")
end

# def make_invitations
#   Invitation.create(dinner_id: 1, guest_id: 1, status: "Attending")
#   Invitation.create(dinner_id: 1, guest_id: 2, status: "Attending")
#   Invitation.create(dinner_id: 1, guest_id: 3, status: "Attending")
#   Invitation.create(dinner_id: 1, guest_id: 4, status: "Attending")
# end

# def make_dish_assignments
#   DishAssignment.create(guest_id: 1, menu_item_id: 1)
# end



make_seeds