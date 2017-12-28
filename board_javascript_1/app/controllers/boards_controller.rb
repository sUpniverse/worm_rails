class BoardsController < ApplicationController
	
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


end
