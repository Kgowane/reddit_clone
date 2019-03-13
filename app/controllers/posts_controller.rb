class PostsController < ApplicationController
  def index
    @posts = Post.select('*, (upvote + downvote) AS total').order('total DESC')


  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params.merge(user_id: current_user.id))

    if @post.save
    redirect_to root_path
    else
      render 'new'
    end
  end

  def downvote_post
    @post = Post.find(params[:id])
    user = @post.user
    @post.downvote += 1 unless current_user == user
    if @post.save
      redirect_to posts_path, alert: "Downvoted #{@post.title}"
    else
      redirect_to posts_path, alert: "Downvoted #{@post.title} failed"
    end
  end

  def upvote_post
    @post = Post.find(params[:id])
    user = @post.user
    @post.upvote += 1 unless current_user == user
    if @post.save
      redirect_to posts_path, alert: "Upvoted #{@post.title}"
    else
      redirect_to posts_path, alert: "Upvoting #{@post.title} failed"
    end
  end

private
  def post_params
    params.require(:post).permit(:weblink, :title, :description)
  end
end
