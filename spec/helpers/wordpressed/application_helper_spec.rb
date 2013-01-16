require 'spec_helper'

describe Wordpressed::ApplicationHelper do
  include Wordpressed::ApplicationHelper

  describe 'archive_links' do
    before do
      @post_1 = FactoryGirl.create(:post, created_at: "2013-01-1")
      @post_2 = FactoryGirl.create(:post, created_at: "2013-02-1")
      @post_3 = FactoryGirl.create(:post, created_at: "2013-03-1")
      @post_4 = FactoryGirl.create(:post, created_at: "2013-02-11")
    end

    it "should create an array of Struts" do

    end

  end
end