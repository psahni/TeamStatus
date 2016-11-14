namespace :db do
  desc "For creating test data"

  task :add_test_data => :environment do
    @user = User.last
    @user.statuses.destroy_all
    puts "creating status..\n"
    @status = @user.statuses.build({:impediments => 'none', :done => true})
    puts "creating tasks..\n"
    @status.tasks.build(:name => 'US12423', :description => 'Did analysis', :task_type => Task::TASK_TYPES[:today])
    @status.tasks.build(:name => 'SIEM 17234', :description => 'Resolve. PR raised.', :task_type => Task::TASK_TYPES[:tomorrow])
    puts "Saving status...\n"
    @status.save(:validate => false)
  end

end