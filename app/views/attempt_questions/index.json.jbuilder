json.array!(@attempt_questions) do |attempt_question|
  json.extract! attempt_question, :id, :question_id, :attempt_id
  json.url attempt_question_url(attempt_question, format: :json)
end
