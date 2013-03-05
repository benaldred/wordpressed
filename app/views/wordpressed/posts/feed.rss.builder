xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0", 'xmlns:content' => "http://purl.org/rss/1.0/modules/content/",
 'xmlns:wfw' => "http://wellformedweb.org/CommentAPI/",  'xmlns:dc' => "http://purl.org/dc/elements/1.1/",
 'xmlns:atom' => "http://www.w3.org/2005/Atom",  'xmlns:sy' => "http://purl.org/rss/1.0/modules/syndication/",
 'xmlns:slash' => "http://purl.org/rss/1.0/modules/slash/", 'xmlns:georss' => "http://www.georss.org/georss",
 'xmlns:geo' => "http://www.w3.org/2003/01/geo/wgs84_pos#",  'xmlns:media' => "http://search.yahoo.com/mrss/"do
  xml.channel do
    xml.title "The Lean Start Blog"
    xml.description "A blog about lean"
    xml.link feed_url(format: 'rss')
    #<atom:link href="http://leanstartco.wordpress.com/feed/" rel="self" type="application/rss+xml"/>
    #<lastBuildDate>Fri, 11 Jan 2013 08:06:27 +0000</lastBuildDate>
    xml.language "en"
    #<sy:updatePeriod>hourly</sy:updatePeriod>
    #<sy:updateFrequency>1</sy:updateFrequency>
    #<generator>http://wordpress.com/</generator>
    #<cloud domain="leanstartco.wordpress.com" port="80" path="/?rsscloud=notify" registerProcedure="" protocol="http-post"/>
    #<image>
    #<url>http://s2.wp.com/i/buttonw-com.png</url>
    #<title>Lean Start</title>
    #<link>http://leanstartco.wordpress.com</link>
    #</image>
    #<atom:link rel="search" type="application/opensearchdescription+xml" href="http://leanstartco.wordpress.com/osd.xml" title="Lean Start"/>
    #<atom:link rel="hub" href="http://leanstartco.wordpress.com/?pushpress=hub"/>

    @posts.each do |post|
      xml.item do
        xml.title post.title
        # escape with <![CDATA[Welcome to WordPress.com! This ...]]>
        xml.description post.content
        #<content:encoded>
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link post_url(post.to_permalink_params)
        xml.guid post_url(post.to_permalink_params)

        # <comments>
        #  http://leanstartco.wordpress.com/2012/12/07/hello-world/#comments
        #  </comments>
        #  <dc:creator>leanstartco</dc:creator>
        #  <category>
        #  <![CDATA[ Uncategorized ]]>
        #  </category>
      end
    end
  end
end