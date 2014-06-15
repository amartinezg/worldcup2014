class Setup < ActiveRecord::Base
	serialize :groups, Hash
	serialize :finalists, Array

	self.table_name = "setup"

	attr_accessible :groups, :finalists
	
	def self.groups
		self.first.groups
	end

	def self.finalists
		self.first.finalists
	end

end