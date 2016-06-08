json.array!(@candies) do |candy|
  json.extract! candy, :id, :title, :discription
  json.url candy_url(candy, format: :json)
end
