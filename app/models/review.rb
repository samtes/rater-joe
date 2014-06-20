class Review < ActiveRecord::Base
	belongs_to :institution, inverse_of: :review

	validates_presence_of :institution
end
