class Forecast < ActiveRecord::Base
	has_many :scores
	belongs_to :user

	attr_accessible :user_id, :group, :forecast1, :forecast2 
end
