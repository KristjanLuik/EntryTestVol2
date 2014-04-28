class LabelsQuestion < ActiveRecord::Base
	belongs_to :question 
	belongs_to :label
end
