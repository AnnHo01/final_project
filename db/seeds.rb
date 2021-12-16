require 'csv'

Pet.delete_all
Province.delete_all
Breed.delete_all
PetGroup.delete_all
Page.delete_all

# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

file1 = Rails.root.join("db/cats.csv")
file2 = Rails.root.join("db/dogs.csv")
file3 = Rails.root.join("db/small-furry.csv")
file4 = Rails.root.join("db/rabbits.csv")
file5 = Rails.root.join("db/TaxRates.csv")

puts "Loading cats, dogs, and small animals data from CSV files"
puts "Loading provincial sales taxes data from CSV files"

data1 = File.read(file1)
data2 = File.read(file2)
data3 = File.read(file3)
data4 = File.read(file4)
data5 = File.read(file5)

cats = CSV.parse(data1, headers: true, encoding: "utf-8")
dogs = CSV.parse(data2, headers: true, encoding: "utf-8")
furries = CSV.parse(data3, headers: true, encoding: "utf-8")
rabbits = CSV.parse(data4, headers: true, encoding: "utf-8")
provinces = CSV.parse(data5, headers: true, encoding: "utf-8")

pets = ["Dog", "Cat", "Small Furry", "Rabbits"]

pets.each do |p|
  pet_group = PetGroup.find_or_create_by(
    name: p,
    image_URL: Faker::LoremFlickr.image(size: "300x300", search_terms: ["#{p}"]),
    total_pets: 0
  )

  if pet_group&.valid?
    if p == "Dog"
      dogs.each do |d|
        # Create a breed data
        breed = pet_group.breeds.create(
          name:  d['name'],
          price: Faker::Number.between(from: 0.00, to: 20000.00),
          description: "#{d['bred_for']}. Lifespan: #{d['life_span']}; can be described as #{d['temperament']}",
          image_URL: d['image/url']
        )
      end
    end

    if p == "Cat"
      cats.each do |c|
        # Create a breed data
        breed = pet_group.breeds.create(
          name:  c['name'],
          price: Faker::Number.between(from: 0.00, to: 20000.00),
          description: "#{c['description']}. Lifespan: #{c['life_span']}; can be described as #{c['temperament']}",
          image_URL: c['image/url']
        )
      end
    end

    if p == "Small Furry"
      furries.each do |sf|
        # Create a breed data
        breed = pet_group.breeds.create(
          name:  sf['breeds/name'],
          price: Faker::Number.between(from: 0.00, to: 20000.00),
          description: "Gathering information",
          image_URL: Faker::LoremFlickr.image(size: "300x300", search_terms: ["#{sf['breeds/name'].split("/")[0]}" , "pet"], match_all: true)
        )
      end
    end

    if p == "Rabbits"
      rabbits.each do |rab|
        # Create a breed data
        breed = pet_group.breeds.create(
          name:  rab['breeds/name'],
          price: Faker::Number.between(from: 0.00, to: 20000.00),
          description: "Gathering information",
          image_URL: Faker::LoremFlickr.image(size: "300x300", search_terms: ["#{rab['breeds/name'].split("/")[0]}" , "rabbit"], match_all: true)
        )
      end
    end
  else
    puts "Invalid pet group, #{p}"
  end
end

provinces.each do |prov|
  # Create province sale taxes data
  province = Province.find_or_create_by(
    name: prov['name'],
    gst: prov['GST'],
    pst: prov['PST'],
    hst: prov['HST']
  )
end

Page.create(
  title: 'About Us',
  content: 'At Happy House Pet Adoption, we value pets and always seeks for a loving home for our adorable “tenants” at Happy House. We mainly rescue dogs, cats, and small animals such as hamsters, guinea pigs, and rabbits./
  Since we are a family non-profit business, we only have around 8 – 10 members that are taking place to take care for the pets. However, we also have several volunteers each week to donate and play with the pets, to ensure interaction and enjoyment for our lovely “tenants”./
  Due to COVID, we figured it’s time to move the business online for accessibility. Before, we have a small shop where we hosted more than hundreds of pets and posted their information on our social media so that people know and come to adopt our lovely “tenants”. We figures it would be best to have a tool online so that more and more people know about our business and gain easy access to give us a hand in adopting our pets./
  The business has been around for 2 years and we have rescued more than 400 pets and had found more than 200 loving families for them. We’re still in the process of expanding our business and looking for more members that are willing to put effort in saving these poor creatures. Pets still have feeling, and still are living creatures, so why would we treat them badly?/
  We are targeting customers of every age, as long as they showed that they’re a pet lover, and that they are responsible and stable enough to take care for one of our children, then we always welcome them to adopt our pets./
  Here\'s an ERD to demonstrate our ecommerce site: ',
  permalink: 'about'
)

puts "#{PetGroup.count} PetGroup created"
puts "#{Breed.count} Breeds created"
puts "#{Page.count} Pages created"
puts "#{Province.count} Provinces created"
