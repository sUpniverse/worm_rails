class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :board
	has_many :likes
end
