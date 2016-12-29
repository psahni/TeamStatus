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
        'Adwitiya' =>       {:email => 'adwitiya.prabhakar@globallogic.com',  :username => 'adwitiya.prabhakar', :sorder => 1 },
        'Ashish'   =>       {:email => 'a.shrivastav@globallogic.com',        :username => 'ashish.shrivastav',  :sorder => 2 },
        'Isha'    =>        {:email => 'isha.mahajan@globallogic.com',        :username => 'isha.mahajan',      :sorder => 3  },
        'Kashish'  =>       {:email => 'kashish.kumar@globallogic.com',       :username => 'kashish.kumar',     :sorder => 4  },
        'Diljohn'  =>       {:email => 'diljohn.singh@globallogic.com',       :username => 'diljohn.singh',     :sorder => 5  },
        'Pankaj'   =>       {:email => 'pankaj.upadhyay@globallogic.com',     :username => 'pankaj.upadhyay',   :sorder => 6  },
        'Prashant Goel'  => {:email => 'prashant.goel@globallogic.com',       :username => 'prashant.goel',     :sorder => 7  },
        'Prashant Sahni' => {:email => 'prashantkumar.sahni@globallogic.com', :username => 'prashant.sahni',    :sorder => 8  },
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

end
