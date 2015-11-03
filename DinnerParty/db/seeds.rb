
Dish.destroy_all
Host.destroy_all
Dinner.destroy_all
User.destroy_all
Guest.destroy_all

def make_seeds
  make_dishes
  make_users
  make_guests
  make_hosts
  make_dinners
end

def make_users
  User.create(name: "Tracy 1")
  User.create(name: "Jessie")
  User.create(name: "Hedi")
  User.create(name: "Dan")
end


def make_hosts
  Host.create(user_id: 1)
  Host.create(user_id: 2)
end

def make_guests
  Guest.create(user_id:1)
  Guest.create(user_id:2)
  Guest.create(user_id:3)
  Guest.create(user_id:1)
end


def make_dinners
  Dinner.create(date: Date.parse("November 2, 2015"), host_id: 1)
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