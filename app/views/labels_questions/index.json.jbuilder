json.array!(@labels_questions) do |labels_question|
  json.extract! labels_question, :id, :question_id, :label_id
  json.url labels_question_url(labels_question, format: :json)
end
