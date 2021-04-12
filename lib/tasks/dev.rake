namespace :dev do
  desc "Configs development environment."
  task setup: :environment do

    puts "Creating kinds of contact..."
    kinds  = %w(Friend Commercial Known)
    
    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end

    puts "Kinds Contact successfully created!"

    puts "Creating Contacts..."
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago,to: 18.years.ago),
        kind: Kind.all.sample
      )
    end

    puts "Contacts successfully created!"

  end
end
