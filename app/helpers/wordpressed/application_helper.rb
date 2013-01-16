module Wordpressed
  module ApplicationHelper
    def archive_links
      Wordpressed::Post.by_month.map do |p|
        date = DateTime.parse("#{p}-1")
        OpenStruct.new(
          title: date.strftime("%B %Y"),
          month: date.strftime("%m"),
          year: date.strftime("%Y"))
      end
    end
  end
end
