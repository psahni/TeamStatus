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

  task :add_order_to_users => :environment do
    USERS =
      {
        'Smita'    =>       {:email => 'smita.batra@globallogic.com',         :username => 'smita.batra',        :sorder => 1 },
        'Ashish'   =>       {:email => 'a.shrivastav@globallogic.com',        :username => 'ashish.shrivastav',  :sorder => 2 },
        'Isha'    =>        {:email => 'isha.mahajan@globallogic.com',        :username => 'isha.mahajan',      :sorder => 3  },
        'Diljohn'  =>       {:email => 'diljohn.singh@globallogic.com',       :username => 'diljohn.singh',     :sorder => 5  },
        'Pankaj'   =>       {:email => 'pankaj.upadhyay@globallogic.com',     :username => 'pankaj.upadhyay',   :sorder => 6  },
        'Prashant Sahni' => {:email => 'prashantkumar.sahni@globallogic.com', :username => 'prashant.sahni',    :sorder => 7  },
        'Shuaib'   =>       {:email => 'shuaib.anwar@globallogic.com',        :username => 'shuaib.anwar',      :sorder => 8  },
        'Madhuri' =>        {:email => 'madhuri.rawat@globallogic.com',       :username => 'madhuri.rawat' ,    :sorder => 9  },
        'Rani'    =>        {:email => 'rani.agrawal@globallogic.com',        :username => 'rani.agrawal',      :sorder => 10 },
        'Priyanka' =>       {:email => 'priyanka.dudeja1@globallogic.com',    :username => 'priyanka.dudeja1',  :sorder => 11 }
      }
    USERS.each do |user_name, user_hash|
      user = User.where(:email => user_hash[:email]).first
      user.sorder = user_hash[:sorder]
      user.save!
      print "#{ user_name } =>  #{ user.sorder }\n"
    end
  end

  task :disable_users => :environment  do
    disable_users = ['adwitiya.prabhakar', 'prashant.goel', 'kashish.kumar']

    disable_users.each do |_username|
      user = User.where(:username => _username).first
      user.is_disabled = true
      user.sorder = -1000
      user.save!
      print "#{ user.username } is disabled\n"
    end
  end

  task :seed_updates => :environment do
    p User.last.is_disabled
    User.update_all('is_disabled = 0')
  end



end
