require 'ffaker'

FactoryGirl.define do

  factory :user do

    first_name { FFaker::Name.first_name }
    middle_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }

    home_phone { FFaker::PhoneNumber.phone_number }
    mobile_phone { FFaker::PhoneNumber.phone_number }

    sequence(:email) { |n| "user#{n}@gmail.com" }
    password  {'Password123'}


  end

end
