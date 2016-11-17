# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

USERS =
  {
    'Adwitiya' =>       {:email => 'adwitiya.prabhakar@globallogic.com',  :username => 'adwitiya.prabhakar' },
    'Diljohn'  =>       {:email => 'diljohn.singh@globallogic.com',       :username => 'diljohn.singh' },
    'Pankaj'   =>       {:email => 'pankaj.upadhyay@globallogic.com',     :username => 'pankaj.upadhyay' },
    'Prashant Goel'  => {:email => 'prashant.goel@globallogic.com',       :username => 'prashant.goel' },
    'Prashant Sahni' => {:email => 'prashantkumar.sahni@globallogic.com', :username => 'prashant.sahni' },
    'Madhuri' =>        {:email => 'madhuri.rawat@globallogic.com',       :username => 'madhuri.rawat' },
    'Rani'    =>        {:email => 'rani.agrawal@globallogic.com',        :username => 'rani.agrawal'},
    'Priyanka' =>       {:email => 'priyanka.dudeja1@globallogic.com',    :username => 'priyanka.dudeja1' },
    'Ashish'   =>       {:email => 'a.shrivastav@globallogic.com',        :username => 'ashish.shrivastav'},
    'Kashish'  =>       {:email => 'kashish.kumar@globallogic.com',       :username => 'kashish.kumar'},
    'Isha'    =>        {:email => 'isha.mahajan@globallogic.com',        :username => 'isha.mahajan'}
  }

USERS.each do |name, user_info|
  puts "=> Creating #{user_info[:name]} with #{user_info[:email]}"
  User.create!(:name => name, :email => user_info[:email], :username => user_info[:username])
end
