class Review < ActiveRecord::Base
	belongs_to :institution, inverse_of: :reviews
	belongs_to :user, inverse_of: :reviews
	has_one :rating


	validates_presence_of :institution
	validates_presence_of :title
	validates_presence_of :score
	validates_presence_of :role
    
end
