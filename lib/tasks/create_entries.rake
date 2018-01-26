require 'open-uri'
require 'open_uri_redirections'

desc 'create entries for feeds'
task :create_entries => :environment do
  Feed.all.each do |feed|
    content = Nokogiri::XML(open("#{feed.url}"))
    content.xpath('//item').take(5).each do |entry|
      local_entry = feed.entries.where(title: entry.xpath('title').inner_text).first_or_initialize
      local_entry.update_attributes(url: entry.xpath('link').inner_text, published_at: entry.xpath('pubDate').inner_text)
    end
    p "Synced Feed - #{feed.name}"
  end
end
