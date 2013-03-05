class Wordpressed::PostsController < ApplicationController
  layout Proc.new { |_| Wordpressed.layout }
  before_filter :load_posts
  respond_to :html, expect: [:feed]
  respond_to :rss, only: [:feed]

  # defer index to parent app
  def index
    @posts = Wordpressed::Post.published
    render :template => 'posts/index'
  end

  def show
    @post = Wordpressed::Post.find_post(params[:id])
    if @post.present?
      render :template => 'posts/show'
    else
      render :file => "#{Rails.root}/public/404", :status => :not_found
    end
  end

  def year
    @posts = Wordpressed::Post.published.within_year(params[:year])
    render :template => 'posts/year'
  end

  def month
    @posts = Wordpressed::Post.published.within_month(params[:year], params[:month])
    render :template => 'posts/month'
  end

  def feed
    @posts = Wordpressed::Post.published
    respond_with(@posts)
  end

  private

    def load_posts
      @recent_posts = Wordpressed::Post.published.recent
      @archive_links = Wordpressed::Post.archive_links
    end
end