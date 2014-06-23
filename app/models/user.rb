class User < ActiveRecord::Base
	has_many :scores
	has_many :forecasts

	attr_accessible :name, :mail

	def self.prepare_mail(type_of_bet)

		if(type_of_bet)
			logger.debug "Usuarios polla de la suerte"
			@user = User.all.sort_by(&:score_sum).reverse.reject{|u| u.forecasts.where(game_id:nil).size==0}
		else
			logger.debug "Usuarios polla Excel"
			@user = User.all.sort_by(&:score_sum2).reverse.reject{|u| u.forecasts.where.not(game_id:nil).size==0}
		end

		@user.each_with_index do |u,i|
			logger.debug "Procesando a #{u.name} - mail: #{u.mail}. Puntos: #{(type_of_bet ? u.score_sum : u.score_sum2)}"
			UserMailer.send_results(u,i+1,(type_of_bet ? u.score_sum : u.score_sum2),type_of_bet).deliver unless u.mail.blank?
		end
	end

	def score_sum
		scores.where(:type_of_bet => 1).sum(:points)
	end

	def score_sum2
		scores.where(:type_of_bet => 2).sum(:points)
	end	
end
