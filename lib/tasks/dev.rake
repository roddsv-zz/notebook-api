namespace :dev do
  desc "Configs development environment."
  task setup: :environment do
    p "Creating Contacts..."
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago,to: 18.years.ago)
      )
    end

    p "Contacts successfully created!"
  end
end
