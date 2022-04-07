Quote.destroy_all

puts "\n== Seeding the database with fixtures =="
system("bin/rails db:fixtures:load")
