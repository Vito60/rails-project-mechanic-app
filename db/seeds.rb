# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

mechanic = Mechanic.create(first_name: "Randall", last_name: "Williams", shop_name: "Goodyear", phone_number: "9045835141")

mechanic = Mechanic.create(first_name: "Matt", last_name: "Williams", shop_name: "S&S Automotive", phone_number: "9045210828")

mechanic = Mechanic.create(first_name: "Ben", last_name: "Hart", shop_name: "Johnsons Automotive", phone_number: "9044726583")

mechanic = Mechanic.create(first_name: "Tommy", last_name: "Williams", shop_name: "Express Oil Change", phone_number: "9045329763")

mechanic = Mechanic.create(first_name: "Doug", last_name: "Lloyd", shop_name: "Goodyear", phone_number: "9045835141")

mechanic = Mechanic.create(first_name: "Jerry", last_name: "Crews", shop_name: "S&S Automotive", phone_number: "9045210828")

mechanic = Mechanic.create(first_name: "Tyler", last_name: "Lowe", shop_name: "Johnsons Automotive", phone_number: "9044726583")

mechanic = Mechanic.create(first_name: "Carter", last_name: "Nelson", shop_name: "Express Oil Change", phone_number: "9045329763")

mechanic = Mechanic.create(first_name: "Garrett", last_name: "Skipper", shop_name: "Goodyear", phone_number: "9045835141")

mechanic = Mechanic.create(first_name: "Kyle", last_name: "Aiken", shop_name: "S&S Automotive", phone_number: "9045210828")

mechanic = Mechanic.create(first_name: "Tobby", last_name: "Farris", shop_name: "Johnsons Automotive", phone_number: "9044726583")

mechanic = Mechanic.create(first_name: "Daniel", last_name: "Bunting", shop_name: "Express Oil Change", phone_number: "9045329763")

mechanic = Mechanic.create(first_name: "Roger", last_name: "Martinez", shop_name: "Goodyear", phone_number: "9045835141")

mechanic = Mechanic.create(first_name: "Steve", last_name: "Rogers", shop_name: "S&S Automotive", phone_number: "9045210828")

mechanic = Mechanic.create(first_name: "Tony", last_name: "McCullough", shop_name: "Johnsons Automotive", phone_number: "9044726583")

mechanic = Mechanic.create(first_name: "Robbie", last_name: "Jackson", shop_name: "Express Oil Change", phone_number: "9045329763")

vehicle = Vehicle.create(make: "Chevrolet", model: "Silverado", mileage: "174239", year: "2009", user_id: 1, mechanic_id: 1)

vehicle = Vehicle.create(make: "Ford", model: "Ranger", mileage: "220468", year: "2001", user_id: 1, mechanic_id: 2)

vehicle = Vehicle.create(make: "Chevrolet", model: "Tahoe", mileage: "102278", year: "2012", user_id: 1, mechanic_id: 3)

vehicle = Vehicle.create(make: "Toyota", model: "Highlander", mileage: "10278", year: "2020", user_id: 1, mechanic_id: 4)

vehicle = Vehicle.create(make: "GMC", model: "Sierra", mileage: "187193", year: "2004", user_id: 2, mechanic_id: 5)

vehicle = Vehicle.create(make: "Toyota", model: "Tacoma", mileage: "145235", year: "2013", user_id: 2, mechanic_id: 6)

vehicle = Vehicle.create(make: "Chevrolet", model: "Silverado", mileage: "98897", year: "2016", user_id: 2, mechanic_id: 7)

vehicle = Vehicle.create(make: "Ford", model: "F-150", mileage: "114278", year: "2011", user_id: 2, mechanic_id: 8)

vehicle = Vehicle.create(make: "Ford", model: "Ranger", mileage: "220468", year: "2001", user_id: 3, mechanic_id: 9)

vehicle = Vehicle.create(make: "Chevrolet", model: "Tahoe", mileage: "102278", year: "2012", user_id: 3, mechanic_id: 10)

vehicle = Vehicle.create(make: "Toyota", model: "Highlander", mileage: "10278", year: "2020", user_id: 3, mechanic_id: 11)

vehicle = Vehicle.create(make: "GMC", model: "Sierra", mileage: "187193", year: "2004", user_id: 4, mechanic_id: 12)

vehicle = Vehicle.create(make: "Ford", model: "Ranger", mileage: "220468", year: "2001", user_id: 4, mechanic_id: 13)

vehicle = Vehicle.create(make: "Chevrolet", model: "Tahoe", mileage: "102278", year: "2012", user_id: 4, mechanic_id: 14)

vehicle = Vehicle.create(make: "Toyota", model: "Highlander", mileage: "10278", year: "2020", user_id: 5, mechanic_id: 15)

vehicle = Vehicle.create(make: "GMC", model: "Sierra", mileage: "187193", year: "2004", user_id: 5, mechanic_id: 16)
 