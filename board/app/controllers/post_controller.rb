class PostController < ApplicationController
  def index
  	@posts = Post.all.reverse
  end

  def new

  end

  def create
  	Post.create(user_id: session[:user_id],
  				title: params[:title],
  				content: params[:content])

	redirect_to '/'
  end

  def show
  	@post = Post.find(params[:id])
    @comments = @post.comments.all
  end 

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(username: params[:username],
                 title: params[:title],
                 content: params[:content])    
    redirect_to "/post/show/#{@post.id}"
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to '/'
  end

  def comment_add
    Comment.create(content: params[:content],
                   user_id: session[:user_id],
                   post_id: params[:id])
    redirect_to :back
  end

  def comment_edit
    @comment = Comment.find(params[:id])
    @post = @comment.post
  end

  def comment_update
    @comment = Comment.find(params[:id])    
    @comment.update(content: params[:content])
    @post = @comment.post

    redirect_to "/post/show/#{@post.id}"
  end

  def comment_destroy
    @comment = Comment.find(params[:id]).destroy    
    
    redirect_to :back
  end

end
