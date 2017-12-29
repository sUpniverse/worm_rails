class Like < ActiveRecord::Base
	belongs_to :user
	belongs_to :board
	belongs_to :comment
end
