class Question < ActiveRecord::Base
	# connections 
	has_many :answers
	has_many :labels, :through => :labels_questions
	has_many :labels_questions
	
	# attributes 
	accepts_nested_attributes_for :labels, reject_if:  :all_blank
	accepts_nested_attributes_for :labels_questions, reject_if:  :all_blank, allow_destroy: true
	accepts_nested_attributes_for :answers,  reject_if: lambda {|attributes| attributes['content'].blank?}, allow_destroy: true #http://guides.rubyonrails.org/form_helpers.html#configuring-the-model

	# validations

end
