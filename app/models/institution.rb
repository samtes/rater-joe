class Institution < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :name, :type, :length, :role, :website
	
	self.inheritance_column = nil

end
