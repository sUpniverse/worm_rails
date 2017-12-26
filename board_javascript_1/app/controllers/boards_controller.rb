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
	end

	#destroy
	def destroy
		Board.find(params[:id]).destroy
		redirect_to '/'
	end

end
