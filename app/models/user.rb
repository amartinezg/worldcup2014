class User < ActiveRecord::Base
	has_many :scores
	has_many :forecasts

	attr_accessible :name, :mail

	def self.prepare_mail
		@user = User.all.sort_by(&:score_sum).reverse

		@user.each_with_index do |u,i|
			logger.debug "Procesando a #{u.name} - mail: #{u.mail}"
			# UserMailer.send_results(u,i+1,u.score_sum).deliver unless u.mail.blank?
		end
	end

	def score_sum
		scores.where.sum(:points)
	end

	def score_sum2
		scores.where(:type_of_bet => 2).sum(:points)
	end	
end
