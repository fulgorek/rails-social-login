json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :active, :admin
  json.url user_url(user, format: :json)
end
