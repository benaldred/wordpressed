class Wordpressed::AdminController < ApplicationController
  layout 'wordpressed/application'
  before_filter :authenticate_user

  def index
    @posts = Wordpressed::Post.order('created_at ASC').all
  end

  def sync
    Wordpressed::Post.sync!
    redirect_to admin_path
  end

  private

  # TODO: replace with a better login system
  def authenticate_user
    if Rails.env.production?
      authenticate_or_request_with_http_basic do |username, password|
        username == "admin" && password == Wordpressed.password
      end
    end
    #warden.custom_failure! if performed?
  end
end