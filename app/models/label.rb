class Label < ActiveRecord::Base
	has_many :questions, :through => :labels_questions
	has_many :labels_questions

end
