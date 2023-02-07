class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  # ===========================================================

  def show
    @posts = Post.find(params[:id])
  end

  # ===========================================================

  def new
    @posts = Post.new
  end

  # ===========================================================

  def create
    @posts = Post.new(post_params)

    if @post.save
      flash[:notice] = "saved successfully"
      redirect_to posts_path
    else 
      flash,now[:error] = @post.errors.full_message.join(', ')
      render :new, status: :unprocessable_entity
    end
  end

  # ===========================================================

  def edit
    @post = Post.find(params[:id])
  end

  # ===========================================================

  def update
    @post = Post.find(params[:id])

    if @post.update(title: params[:post][:title], body: params[:post][:body])
      flash[:notice] = "Updated Successfully"
      redirect_to post_path(@post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # ===========================================================

  def destroy
    @posts = Post.find(params[:id])
    @posts.destroy

    redirect_to posts_path, notice: "Post was successfully deleted."
  end

  # ===========================================================

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
 
end
