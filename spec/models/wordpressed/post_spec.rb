require 'spec_helper'

describe Wordpressed::Post do

  describe "find_or_create_from_json" do

    context "when new post created" do
      before do
        @post = Wordpressed::Post.find_or_create_from_json(wordpress_json)
      end

      it "should create a post from wordpress.com data" do
        Wordpressed::Post.all.count.should == 1
      end

      it "should set the wordpress id" do
        @post.wp_id.should == 11
      end

      it "should set the wordpress url" do
        @post.wp_url.should == "http://leanstartco.wordpress.com/2013/01/11/test-post/"
      end

      it "should set the created_at timestamp" do
        @post.created_at.should == DateTime.parse("2013-01-11T08:06:25+00:00").utc
      end

      it 'should set the updated_at timestamp' do
        @post.updated_at.should == DateTime.parse("2013-01-11T10:06:25+00:00").utc
      end

      it "should set the posts status" do
        @post.status.should == 'published'
      end
    end
  end

  describe ".by_month" do
    before do
      @post_4 = FactoryGirl.create(:post, created_at: "2013-02-11")
      @post_1 = FactoryGirl.create(:post, created_at: "2013-01-1")
      @post_2 = FactoryGirl.create(:post, created_at: "2013-02-1")
      @post_3 = FactoryGirl.create(:post, created_at: "2013-03-1")
    end

    it "should group posts by the year and month" do
      Wordpressed::Post.by_month.should == {
        "2013-01" => [@post_1],
        "2013-02" => [@post_2, @post_4],
        "2013-03" => [@post_3]
      }
    end
  end
  # url

  describe '#month_and_year' do
    it "should use created_at to generate a month and year" do
      post = FactoryGirl.create(:post, created_at: "2013-03-1")
      post.month_and_year.should == "2013-03"
    end
  end

  describe '#to_permalink_params' do
    it "should create a hash to generate a path using link_to" do
      post = FactoryGirl.create(:post, created_at: "2015-04-1")
      post.to_permalink_params == { id: post.slug, month: "04", year: "2015" }
    end
  end
end