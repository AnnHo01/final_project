require 'csv'

Pet.delete_all
Breed.delete_all
PetGroup.delete_all

# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

file1 = Rails.root.join("db/cats.csv")
file2 = Rails.root.join("db/dogs.csv")
file3 = Rails.root.join("db/small-furry.csv")

puts "Loading cats, dogs, and small animals data from CSV files"

data1 = File.read(file1)
data2 = File.read(file2)
data3 = File.read(file3)

cats = CSV.parse(data1, headers: true, encoding: "utf-8")
dogs = CSV.parse(data2, headers: true, encoding: "utf-8")
furries = CSV.parse(data3, headers: true, encoding: "utf-8")

pets = ["Dog", "Cat", "Small Furry"]

i = 0
pets.each do |p|
  pet_group = PetGroup.find_or_create_by(
    name: p,
    image: Faker::LoremFlickr.image(size: "300x300", search_terms: ["#{p}"])
  )

  if pet_group&.valid?
    if p == "Dog"
      dogs.each do |d|
        if i < 15
          # Create a breed data
          breed = pet_group.breeds.create(
            name:  d['name'],
            price: Faker::Number.between(from: 0.00, to: 20000.00),
            description: "#{d['bred_for']}. Lifespan: #{d['life_span']}; can be described as #{d['temperament']}",
            image: d['image/url']
          )
        end
        i+=1
      end
    end

    i = 0
    if p == "Cat"
      cats.each do |c|
        if i < 15
          # Create a breed data
          breed = pet_group.breeds.create(
            name:  c['name'],
            price: Faker::Number.between(from: 0.00, to: 20000.00),
            description: "#{c['description']}. Lifespan: #{c['life_span']}; can be described as #{c['temperament']}",
            image: c['image/url']
          )
        end
        i+=1
      end
    end

    if p == "Small Furry"
      furries.each do |sf|
        # Create a breed data
        breed = pet_group.breeds.create(
          name:  sf['breeds/name'],
          price: Faker::Number.between(from: 0.00, to: 20000.00),
          description: "Gathering information",
          image: Faker::LoremFlickr.image(size: "300x300", search_terms: ["#{sf['breeds/name'].split("/")[0]}" , "pet"], match_all: true)
        )
      end
    end
  else
    puts "Invalid pet group, #{p}"
  end
end

puts "#{PetGroup.count} PetGroup created"
puts "#{Breed.count} Breeds created"