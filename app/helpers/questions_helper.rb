module QuestionsHelper
	def vote_tally(topic)
		topic.votes.where(up: true).count - topic.votes.where(down: true).count
	end
end