class BoardsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	def index
		@boards = Board.all	
	end

	#create
	def new
		
	end

	def create
		@board = Board.create(title: params[:title],
					 content: params[:contents])	
		redirect_to "/board/#{@board.id}"
	end

	#read
	def show
		@board = Board.find(params[:id])
		@like = Like.where(user_id:current_user.id, board: @board.id)

		#@comment_like = Like.where(user_id:current_user.id comment: @)
	end

	#update
	def edit
		@board = Board.find(params[:id])
	end

	def update
		@board = Board.find(params[:id])
		@board.update(title: params[:title],
					 content: params[:contents])	
		redirect_to "/board/#{@board.id}"
	end

	#destroy
	def destroy
		Board.find(params[:id]).destroy
		redirect_to '/'
	end

	#like
	def like_board
		puts "서버로 요청이 왔다."
		user_like = Like.where(user_id: current_user.id, board_id: params[:id])
    	if user_like.count > 0
      		user_like.first.destroy
   		else
      		Like.create(
        	user_id: current_user.id,
        	board_id: params[:id]
      		)
    	end
    	@like = Board.find(params[:id]).likes.count
	end

	def create_comment
		@comment = Comment.create(
			user_id: current_user,
			board_id: params[:id],
			contents: params[:contents]
		)
		puts params[:contents]
		puts "서버로 요청이 왔따."
	end

	def destroy_comment
		@comment = Comment.find(params[:comment_id]).destroy
		puts "#{params[:comment_id]}번 댓글 삭제"
	end

	def update_comment
		@comment = Comment.find(params[:comment_id]).update(contents: params[:contents])
	end


	def like_comment
		puts "서버로 좋아요 요청이 왔다."
		user_like = Like.where(user_id: current_user.id, comment_id: params[:id])
		if user_like.count > 0
			user_like.first.destroy
		else
			Like.create(
			user_id: current_user.id,
			comment_id: params[:id]	
			)
		end
		@like = Comment.find(params[:id]).likes.count
	end


end
