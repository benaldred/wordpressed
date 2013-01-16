require 'spec_helper'

describe Wordpressed::PostsController do
  render_views

  context 'using default config' do
    before do
      @posts = FactoryGirl.create_list(:post, 3)
    end


    describe 'on GET to posts#index' do
      before { get :index }

      it "should respond with success and render template" do
        response.should be_success
        response.should render_template('index')
      end

      it "should render the default template" do
        response.should render_template('layouts/application')
      end

      it "should assign the posts" do
        assigns(:posts).should eq(@posts)
      end

      it "should assign the archive links" do
        pending
      end
    end

    describe "on GET to posts#show" do

      it "should throw a 404 when post is not found" do
        get :show, year: "2012", month: "12", id: "not-existent-post"
        response.should_not be_success
        expect(response.code).to eq("404")
      end

      context 'when a post has been created but not published' do
        before do
          @post = FactoryGirl.create(:post, status: "draft")
        end

        it "should only show published posts" do
          get :show, year: "2012", month: "12", id: @post.slug
          response.should_not be_success
          expect(response.code).to eq("404")
        end
      end


      context 'when a post has been published' do
        before { get :show, @posts.first.to_permalink_params }

        it "should respond with success and render template" do
          response.should be_success
          response.should render_template('show')
        end
      end
    end

    describe "archive pages" do
      describe 'on GET to posts#year' do

        before { get :year, year: '2012' }

        it "should respond with success and render template" do
          response.should be_success
          response.should render_template('year')
        end

        it "should assign the posts for the year" do
          pending
        end

        it "should assign the archive links" do
          pending
        end
      end

      describe 'on GET to posts#month' do

        before { get :month, year: '2012', month: '12' }

        it "should respond with success and render template" do
          response.should be_success
          response.should render_template('month')
        end

        it "should assign the posts for the year" do
          pending
        end

        it "should assign the archive links" do
          pending
        end
      end
    end
  end

  context 'using custom layout' do
    before(:all) do
      @original_layout = Wordpressed.layout
      Wordpressed.layout = 'alternative'
    end

    after(:all) do
      Wordpressed.layout = @original_layout
    end

    describe 'on GET to posts#index' do
      before { get :index }

      it "should render the custom template" do
        response.should_not render_template('layouts/application')
        response.should render_template('layouts/alternative')
      end
    end
  end
  # test the correct layout is rendered
  # load posts and archived links

  # index
  # - renders the posts#index template

  # show
  # if post for slug found
  #   - renders the posts¢show template
  # else
  #   - renders 404

  # year
  # - renders posts#year

  # month
  # - renders posts#month
end