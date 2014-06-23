class Institution < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :name, :type, :length, :role, :website
	validates_presence_of :user

	has_many :reviews, inverse_of: :institution

	self.inheritance_column = nil

end
