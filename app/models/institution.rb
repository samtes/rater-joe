class Institution < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :name, :type, :length, :role, :website
	validates_presence_of :user
	self.inheritance_column = nil

end
