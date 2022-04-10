Company.destroy_all # Destroys Associated Users and Quotes

puts "\n== Seeding the database with fixtures =="
system("bin/rails db:fixtures:load")
