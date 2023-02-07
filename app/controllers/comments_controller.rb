class CommentsController < ApplicationController
    before_action :set_comment, only: [:edit, :update, :destroy]
  
    def new
      @comment = Comment.new
    end
  
    def create
      @comment = Comment.new(comment_params)
      if @comment.save
        redirect_to @comment.post, notice: 'Comment was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @comment.update(comment_params)
        redirect_to @comment.post, notice: 'Comment was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @comment.destroy
      redirect_to @comment.post, notice: 'Comment was successfully destroyed.'
    end
  
    private
      def set_comment
        @comment = Comment.find(params[:id])
      end
  
      def comment_params
        params.require(:comment).permit(:content, :post_id)
      end
  end
  