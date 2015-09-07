FactoryGirl.define do
  factory :authorization do
    provider "facebook"
	uid "MyString"
	user_id 1
	token "MyString"
	secret "MyString"
  end

end
