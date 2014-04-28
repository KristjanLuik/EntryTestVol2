json.array!(@tests) do |test|
  json.extract! test, :id, :title, :description, :duration
  json.url test_url(test, format: :json)
end
