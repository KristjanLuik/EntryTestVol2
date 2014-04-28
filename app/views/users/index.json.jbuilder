json.array!(@users) do |user|
  json.extract! user, :id, :name, :surname, :personal_id, :email, :phone_number, :city, :country, :gender, :address, :role_id, :password
  json.url user_url(user, format: :json)
end
