require 'open-uri'
require 'open_uri_redirections'

class CreateFeedEntriesJob < ApplicationJob
  queue_as :rss_feeds

  def perform(*args)
    Feed.all.each do |feed|
      content = Nokogiri::XML(open("#{feed.url}"))
      content.xpath('//item').each do |entry|
        feed_entry = feed.entries.where(title: entry.xpath('title').inner_text).first_or_initialize
        feed_entry.update_attributes(url: entry.xpath('link').inner_text, published_at: entry.xpath('pubDate').inner_text)
      end
      puts  "Synced Feed - #{feed.name}"
    end
  end
end
