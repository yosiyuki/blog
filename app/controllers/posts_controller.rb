class PostsController < ApplicationController
  http_basic_authenticate_with name: 'tnkjapan', password: 'nihon', except: [:show, :homepage]
  def homepage
    @posts = Post.order('created_at DESC').all
  end

  def index
    @posts = Post.order('created_at DESC').all
  end

  def new
    @post = Post.new
    @posts = Post.all
    @posts.each do |post|
      if post.created_at.year == Time.now.year && post.created_at.month == Time.now.month && post.created_at.day == Time.now.day
        # まだ分からないです。
      end
    end
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:text)
  end
end
