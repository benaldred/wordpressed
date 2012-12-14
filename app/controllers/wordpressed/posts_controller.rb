class Wordpressed::PostsController < ApplicationController

  # defer index to parent app
  def index
    render :template => 'posts/index'
  end

  def show
    @post = Wordpressed::Post.find_by_slug(params[:id])
    # handle non found post
    render :template => 'posts/show'
  end

  def year
    render :template => 'posts/year'
  end

  def month
    render :template => 'posts/month'
  end
end