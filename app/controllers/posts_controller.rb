class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def search
    @posts = Post.search(params[:query])
  end

  def index
    @posts = Post.all
    @page = params[:page].to_i || 1

    if params[:query].present?
      @posts = @posts.where("title LIKE ? OR body LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    end
    
    @posts = @posts.limit(10).offset((@page - 1) * 10)
  end

  # ===========================================================

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  # ===========================================================

  def new
    @post = Post.new
  end

  # ===========================================================

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = "Updated Successfully"
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # ===========================================================

  def edit
    @post = Post.find(params[:id])
  end

  # ===========================================================

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:notice] = "Updated Successfully"
      redirect_to posts_path(@post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # ===========================================================

  def destroy
    @posts = Post.find(params[:id])
    @posts.destroy
    flash[:notice] = "Post was successfully deleted."
    redirect_to posts_path
  end

  # ===========================================================

  private

  def set_post
    @post = Post.find(params[:id])
  end
  
  def post_params
    params.require(:post).permit(:title, :body)
  end

end


# =============================GRAVEYARD========================
