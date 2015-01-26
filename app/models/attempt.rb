class Attempt < ActiveRecord::Base
	belongs_to :user
	belongs_to :timetable
	has_many :attempt_answers
	has_many :answers, :through => :attempt_answers
	has_many :attempt_questions
	has_many :questions, :through => :attempt_questions

	
def generate_test
	# TODO! choose random questions+answers from the tied-up test.
	# hangi test
	test=self.timetable.test
	# vali testiga seotud kysimused (seos on l2bi labelite?) TODO!

	self.add_by_difficulty('kerge', test.easy_count)
	self.add_by_difficulty('keskmine', test.medium_count)
	self.add_by_difficulty('raske', test.hard_count)		
	# questions = Question.order("RANDOM()").all # ajutine!
	# # salvesta kysimused attempti kylge
	# questions.each do |q|
	# 	aq = AttemptQuestion.create(:question=>q, :attempt=>self)
	# 	# vali salvestatud kysimuse vastused
	# 	a_count=rand(q.min_options..q.max_options)
	# 	c_count=rand(q.min_correct..q.max_correct)
	# 	f_count=a_count-c_count
	# 	logger.debug "\nthere are #{c_count} correct and #{f_count} incorrect answers \n"
	# 	c = Answer.where(:correct=>true, :question=> q).order("RANDOM()").first(c_count)
	# 	f = Answer.where(:correct=>false, :question=> q).order("RANDOM()").first(f_count)
	# 	answers= c + f
	# 	logger.debug "\ngot #{c.count} correct and #{f.count} incorrect answers totaling at #{answers.count} (before shuffle)\n"
	# 	answers.shuffle!
	# 	logger.debug "This question has a total of #{answers.count} answers\n"
	# 	# salvesta vastused attempti kylge
	# 	answers.each do |a|
	# 		aa=AttemptAnswer.create(:answer=>a, :attempt=>self)
	# 	end
	# end

	
end

def add_by_difficulty(level, count)

 	questions = Question.where("difficulty = ?", level).order("RANDOM()").first( count ? count : 1 ) #all # ajutine!
	# salvesta kysimused attempti kylge
	questions.each do |q|
		aq = AttemptQuestion.create(:question=>q, :attempt=>self)
		# vali salvestatud kysimuse vastused
		a_count=rand(q.min_options..q.max_options)
		c_count=rand(q.min_correct..q.max_correct)
		f_count=a_count-c_count
		#logger.debug "\nthere are #{c_count} correct and #{f_count} incorrect answers \n"
		c = Answer.where(:correct=>true, :question=> q).order("RANDOM()").first(c_count)
		f = Answer.where(:correct=>false, :question=> q).order("RANDOM()").first(f_count)
		answers= c + f
		#logger.debug "\ngot #{c.count} correct and #{f.count} incorrect answers totaling at #{answers.count} (before shuffle)\n"
		answers.shuffle!
		#logger.debug "This question has a total of #{answers.count} answers\n"
		# salvesta vastused attempti kylge
		answers.each do |a|
			aa=AttemptAnswer.create(:answer=>a, :attempt=>self)
		end
	end

end


end
