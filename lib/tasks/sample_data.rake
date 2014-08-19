namespace :db do 
	desc "Fill database with sample data"
	task populate: :environment do
		make_movies
	end
end

def make_movies
	25.times do |n|
		title = Faker::Commerce.product_name
		description = Faker::Lorem.sentence(100)
		total_gross = Faker::Number.number(10)
		rating = "PG-#{n+1}"
		released_on = Faker::Business.credit_card_expiry_date

		Movie.create!(
			title: title,
			description: description,
			total_gross: total_gross,
			rating: rating,
			released_on: released_on)
	end
end