class BlogPostsController < ApplicationController
  def index
    @blog_posts = BlogPost.all
  end

  def new
    @blog_post = BlogPost.new
  end

  def show
    @blog_post = BlogPost.find(params[:id])
  end
end