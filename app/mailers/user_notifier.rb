class UserNotifier < ApplicationMailer

    include SendGrid
    include MailarHelper

   def send_status(users_status)
     @users_status =  users_status
     mail(to: 'prashant.sahni5@gmail.com') do |format|
       format.html{
         render layout: 'report', template: 'user_notifier/send_status.html.erb'
       }
     end
   end

end


#ActionController::Base.new.render_to_string
# def self.send_simple_message
#   RestClient.post "https://api:key-0e4691d420231ec4212e3aab92114653"\
#   "@api.mailgun.net/v3/sandboxb8fadee0fe77443aa31f4388fbbf639b.mailgun.org/messages",
#   :from => "Mailgun Sandbox <postmaster@sandboxb8fadee0fe77443aa31f4388fbbf639b.mailgun.org>",
#   :to => "Prashant <prashant.sahni5@gmail.com>",
#   :subject => "Hello Prashant",
#   :text => "Congratulations Prashant, you just sent an email with Mailgun!  You are truly awesome!  You can see a record of this email in your logs: https://mailgun.com/cp/log .  You can send up to 300 emails/day from this sandbox server.  Next, you should add your own domain so you can send 10,000 emails/month for free."
# end

#https://elements.heroku.com/addons/mailgun
