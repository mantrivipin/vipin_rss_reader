desc 'create entries for feeds'
task :create_entries => :environment do
  puts 'Adding entries started'
  CreateFeedEntriesJob.delay.perform_now
  puts 'Adding entries completed!'
end

