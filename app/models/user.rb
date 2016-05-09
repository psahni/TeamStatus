class User < ActiveRecord::Base

  cattr_accessor :users
  @@users = {
        'Adwitiya' => 'adwitiya.prabhakar@globallogic.com',
        'Danish' => 'danish.arora@globallogic.com',
        'Diljohn' => 'diljohn.singh@globallogic.com',
        'Pankaj' => 'pankaj.upadhyay@globallogic.com',
        'Prashant Goel' => 'prashant.goel@globallogic.com',
        'Prashant Sahni' => 'prashantkumar.sahni@globallogic.com',
        'Madhuri' => 'madhuri.rawat@globallogic.com',
        'Rani' => 'rani.agrawal@globallogic.com',
        'Priyanka' => 'priyanka.dudeja1@globallogic.com'
    }

    validates :email, :presence => true, :uniqueness => true

end
