require 'spec_helper'

describe Wordpressed::Constraints do

  describe '.matches_year?' do

    it "should match a 4 digit number" do
      Wordpressed::Constraints.matches_year?("1984").should be_true
    end

    it "should reject a non 4 digit year" do
      Wordpressed::Constraints.matches_year?("78").should be_false
    end
  end

  describe '.matches_month?' do
    it "should match a digit that is a valid month" do
      Wordpressed::Constraints.matches_month?("01").should be_true
      Wordpressed::Constraints.matches_month?("06").should be_true
      Wordpressed::Constraints.matches_month?("12").should be_true
    end

    it "should accept 1 digit numbers too" do
      Wordpressed::Constraints.matches_month?("2").should be_true
    end

    it "should reject an invalid month digit" do
      Wordpressed::Constraints.matches_month?("00").should be_false
      Wordpressed::Constraints.matches_month?("13").should be_false
    end
  end
end