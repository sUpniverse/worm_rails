class PostController < ApplicationController
  def index
  	@posts = Post.all.reverse
  end

  def new

  end

  def create
  	Post.create(username: params[:username],
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
                   post_id: params[:id])
    redirect_to :back
  end

  def comment_edit
    @comments = Comment.find(params[:id])
    @post = @comments.post
  end

  def comment_update
    @comments = Comment.find(params[:id])    
    @comments.update(content: params[:content])
    @post = @comments.post

    redirect_to "/post/show/#{@post.id}"
  end

  def comment_destroy
    @comments = Comment.find(params[:id]).destroy    
    
    redirect_to :back
  end

end
