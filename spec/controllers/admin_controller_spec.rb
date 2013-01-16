require 'spec_helper'

describe Wordpressed::AdminController do
  render_views


  describe 'on GET to admin#index' do
    before { get :index }

    it "should respond with success and render template" do
      response.should be_success
      response.should render_template('index')
    end

    it "should render the admin template" do
      response.should render_template('layouts/wordpressed/application')
    end
  end
end