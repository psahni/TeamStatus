# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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
    'Priyanka' =>       {:email => 'priyanka.dudeja1@globallogic.com',    :username => 'priyanka.dudeja1',  :sorder => 11 },
    'Ankur Verma' =>    {:email => 'ankur.verma1@globallogic.com',        :username => 'ankur.verma',       :sorder => 12 }
  }

USERS.each do |name, user_info|
  if User.where(:email => user_info[:email]).first
    puts "=> Already added #{user_info[:name]} with #{user_info[:email]}"
  else
    puts "Adding #{user_info[:name]} with #{user_info[:email]}"
    User.create!(:name => name, :email => user_info[:email], :username => user_info[:username], :sorder => user_info[:sorder])
  end
end
