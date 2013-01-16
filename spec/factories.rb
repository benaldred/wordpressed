FactoryGirl.define do

  sequence :post_title do |n|
    "Post #{n}"
  end

  sequence :post_slug  do |n|
    "test-post-#{n}"
  end

  sequence :post_created_at, 1 do |n|
    month = n.modulo(12)
    month = 1 if month == 0
    "2013-#{month}-1"
  end

  factory :post, class: Wordpressed::Post do
    title       { generate(:post_title) }
    content     'post contents'
    slug        { generate(:post_slug) }
    created_at  { generate(:post_created_at) }
    status      'published'
  end
end