require 'faker'

FactoryGirl.define do
	factory :user do
		username { Faker::Name.unique.name }
		roll_number { Faker::Lorem.word }
		password { Faker::Lorem.word }
		admin false
	end

	factory :admin, class: User do
		username { Faker::Name.unique.name }
		roll_number { Faker::Lorem.word }
		password { Faker::Lorem.word }
		admin true
	end

	factory :book do
		name { Faker::Name.unique.name }
		description { Faker::Lorem.sentence }
	end

	factory :borrow do
		user
		book
	end
end