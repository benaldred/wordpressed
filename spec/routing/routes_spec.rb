require 'spec_helper'

describe "Wordpressed routes" do
  #before(:each) { @routes = Wordpressed::Engine.routes }

  it "should route to the posts index" do
    #{ :get => '/wordpressed' }.should route_to(:controller => "wordpressed/posts")
    pending
  end

  describe "show blog posts" do
    it "should route to post" do
      #{ :get => "/2012/11/when-to-use-routing-specs" }.
      #  should route_to(
      #  :controller => "posts",
      #  :year => "2012",
      #  :month => "11",
      #  :id => "when-to-use-routing-specs"
      #)
      pending
    end
  end

end
# test post show route constraints
# test post by month constraints
# test year constraints
