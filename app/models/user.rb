class User < ActiveRecord::Base
	has_many :scores
	has_many :forecasts

	attr_accessible :name, :mail

	def self.users_results
		User.joins(:scores).select("users.id, SUM(scores.points) as Points").group("users.id").order("Points desc")
	end
end
