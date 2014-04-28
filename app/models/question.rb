class Question < ActiveRecord::Base
	has_many :answers
	has_many :labels, :through => :labels_questions
	has_many :labels_questions
end
