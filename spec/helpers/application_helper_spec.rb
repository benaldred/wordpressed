require 'spec_helper'

describe Wordpressed::ApplicationHelper do

  describe '#archive_links' do
    before do
      @post_1 = FactoryGirl.create(:post, created_at: "2013-01-1")
      @post_2 = FactoryGirl.create(:post, created_at: "2013-02-1")
      @post_3 = FactoryGirl.create(:post, created_at: "2013-03-1")
      @post_4 = FactoryGirl.create(:post, created_at: "2013-02-11")
    end

    it "should create an array of Struts" do
      helper.archive_links.class.should == Array
    end

    it "should create one entry for each month/year" do
      helper.archive_links.size.should == 3
    end

    context "data" do
      before { @link = helper.archive_links.first }
      it "should have a readble title" do
        @link.title.should == "January 2013"
      end

      it "should hold the year and month" do
        @link.month.should == "01"
        @link.year.should == "2013"
      end
    end
  end
end