# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

USERS =
  {
    'Sanyam'    =>      {:email => 'sanyam.bharti@globallogic.com',          :username => 'sanyam.bharti',  :sorder => 1 },
    'Deepak'   =>       {:email => 'deepak.tyagi@globallogic.com',           :username => 'deepak.tyagi',   :sorder => 2 },
    'Prashant'    =>    {:email => 'prashantkumar.sahni@globallogic.com',    :username => 'prashantkumar.sahni', :sorder => 3  },
    'Jeevenjot'  =>     {:email => 'jeevenjot.singh@globallogic.com',        :username => 'jeevenjot.singh',     :sorder => 4  },
    'Sachin' => {:email => 'sachin.rai@globallogic.com', :username => 'sachin.rai', :sorder => 5 },
    'Ankur' =>  {:email => 'ankur.rana@globallogic.com', :username => 'ankur.rana', :sorder =>  6  },
    'Arti' =>   {:email => 'aarti.gupta@globallogic.com', :username => 'aarti.gupta', :sorder => 7}
  }

USERS.each do |name, user_info|
  if User.where(:email => user_info[:email]).first
    puts "=> Already added #{user_info[:name]} with #{user_info[:email]}"
  else
    puts "Adding #{user_info[:name]} with #{user_info[:email]}"
    User.create!(:name => name, :email => user_info[:email], :username => user_info[:username], :sorder => user_info[:sorder])
  end
end
