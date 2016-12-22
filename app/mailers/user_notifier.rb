class UserNotifier < ApplicationMailer

    default :from     => "Lime Team <system@LogRhythmGlobalLogic.com>",
            :reply_to => "Logrhythm-LimeTeam <Logrhythm-LimeTeam@globallogic.com>"

    layout 'report'

    include SendGrid
    include MailarHelper
    add_template_helper(StatusHelper)

   def send_status(today_statuses, user_email)
     @today_statuses =  today_statuses
     mail(
        :to => user_email,
        :subject => "Lime Team Status #{ Time.now.strftime("%dth %B %Y") }"
     ) do |format|
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
