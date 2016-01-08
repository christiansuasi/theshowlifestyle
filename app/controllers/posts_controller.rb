class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]	
  def index

  	#all posts are being looped and rendered by view
  	#odering all posts in chrono order
  	@posts = Post.all.order("created_at DESC")
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)

  	if @post.save
  		redirect_to @post
  	else
  		render 'new'
  	end
  end


  #rails principle 'dry'=don't repeat yourself
  def show
  	#@post = Post.find(params[:id])
  end

  def edit
  	#@post = Post.find(params[:id])
  end

  def update
  	@post = Post.find(params[:id])


  	#redirect to post show page, else render edit form
  	if @post.update(post_params)
  		redirect_to @post
  	else
  		render 'edit'
  	end
  end

  #added to before action
  def destroy
  	@post.destroy
  	redirect_to root_path
  end


  #private methods start
  private

  #might not be necessary
  def find_post
  	@post = Post.find(params[:id])
  end

  #define post params
  def post_params
  	params.require(:post).permit(:title, :body)
  end

end
