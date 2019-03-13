class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create

    @post = Post.find(params[:post_id])
    @comment =  @post.comments.create(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def downvote_comment
    post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    user = @comment.user
    @comment.downvote += 1 unless current_user == user
    if @comment.save
      redirect_to post_path(post), alert: "Downvoted #{@comment.comment}"
    else
      redirect_to post_path(post), alert: "Downvoted #{@comment.comment} failed"
    end
  end

  def upvote_comment
    post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    user = @comment.user
    @comment.upvote += 1 unless current_user == user
    if @comment.save
      redirect_to post_path(post), alert: "Upvoted #{@comment.comment}"
    else
      redirect_to post_path(post), alert: "Upvoted #{@comment.comment} failed"
    end
  end

private
    def comment_params
      params.require(:comment).permit(:comment).merge(user_id: params[:user_id])
    end
end
