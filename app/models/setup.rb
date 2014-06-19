class Setup < ActiveRecord::Base
	serialize :groups, Hash
	serialize :finalists, Array
	serialize :teams, Hash

	self.table_name = "setup"

	attr_accessible :groups, :finalists, :teams
	
	def self.groups
		self.first.groups
	end

	def self.finalists
		self.first.finalists
	end

	def self.teams
		self.first.teams
	end

end