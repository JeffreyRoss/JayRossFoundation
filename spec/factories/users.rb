require 'ffaker'

FactoryGirl.define do

  factory :user do
  	transient do
  		role_name "registered"
  	end

    first_name { FFaker::Name.first_name }
    middle_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }

    home_phone { FFaker::PhoneNumber.phone_number }
    mobile_phone { FFaker::PhoneNumber.phone_number }

    sequence(:email) { |n| "user#{n}@gmail.com" }
    password  {'Password123'}


    provider {'facebook'}

    role do
    	Role.find_by(name: role_name) || FactoryGirl.create(:role, name: role_name)
    end
  end
end
