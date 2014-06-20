class Institution < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :name, :type, :length, :role, :website
	validates_presence_of :user

	has_one :review, inverse_of: :institution
	accepts_nested_attributes_for :review

	self.inheritance_column = nil

end
