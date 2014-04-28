json.array!(@questions) do |question|
  json.extract! question, :id, :content, :difficulty, :status
  json.url question_url(question, format: :json)
end
