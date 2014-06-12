class User < ActiveRecord::Base
	has_many :scores
	has_many :forecasts

	attr_accessible :name, :mail

	def self.prepare_mail
		@results = self.users_results

		@results.each_with_index do |r,i|

			@user = User.find(r[:id])


			logger.debug "Procesando a #{@user.name} - mail: #{@user.mail}"

			UserMailer.send_results(@user,i+1,r[:Points]).deliver unless @user.mail.blank?
		end
	end

	def score_sum
		scores.sum(:points)
	end
end
