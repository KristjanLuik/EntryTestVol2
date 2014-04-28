class Timetable < ActiveRecord::Base
	belongs_to :test
	has_many :attempts
end
