json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :middle_name, :last_name, :home_phone, :mobile_phone, :email
  json.url user_url(user, format: :json)
end
