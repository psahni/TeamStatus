class UserNotifier < ApplicationMailer

    default from: "system@LogRhythmGlobalLogic.com"

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

   def send_test_mail()
     mail(to: 'prashant.sahni5@gmail.com', subject: "Welcome to LogRhythmGlobalLogic")
   end

end
