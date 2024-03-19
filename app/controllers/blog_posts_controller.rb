class BlogPostsController < ApplicationController
  before_action :set_blog_post, only: %i[edit update destroy show]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @blog_posts = user_signed_in? ? BlogPost.sorted : BlogPost.published.sorted
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)
    if @blog_post.save
      redirect_to @blog_post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    render :edit
  end

  def update
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show; end

  def destroy
    @blog_post.destroy
    redirect_to root_path
  end

  private

  def set_blog_post
    @blog_post = user_signed_in? ? BlogPost.find(params[:id]) : BlogPost.published.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def blog_post_params
    params.require(:blog_post).permit(:title, :content, :published_at)
  end
end
