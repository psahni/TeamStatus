class UserNotifier < ApplicationMailer

    default :from => "system@LogRhythmGlobalLogic.com"
    layout 'report'

    include SendGrid
    include MailarHelper
    add_template_helper(StatusHelper)

   def send_status(today_statuses)
     @today_statuses =  today_statuses
     mail(:to => 'prashant.sahni5@gmail.com') do |format|
       format.html{
         render :template =>'user_notifier/send_status.html.erb'
       }
     end
   end

   def send_test_mail()
     mail(:to => 'prashant.sahni5@gmail.com',
          :subject => "Welcome to LogRhythmGlobalLogic"
     )
   end

end
