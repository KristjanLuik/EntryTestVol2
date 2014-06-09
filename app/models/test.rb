class Test < ActiveRecord::Base
	has_many :timetables

	# attributes
	accepts_nested_attributes_for :timetables,  reject_if: lambda {|attributes| attributes['slots'].blank? || attributes['location'].blank?}, allow_destroy: true #http://guides.rubyonrails.org/form_helpers.html#configuring-the-model

end
