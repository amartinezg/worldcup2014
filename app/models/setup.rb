class Setup < ActiveRecord::Base
	serialize :groups, Hash

	self.table_name = "setup"

	attr_accessible :groups
	
	def self.groups
		self.first.groups
	end

end