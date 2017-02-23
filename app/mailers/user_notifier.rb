class UserNotifier < ApplicationMailer

  default :from => "Lime Team <system@LogRhythmGlobalLogic.com>"

  ENG_TEAM_EMAIL  = "LimeEngTeam@logrhythm.com"
  LIME_TEAM_EMAIL = "Logrhythm-LimeTeam <Logrhythm-LimeTeam@globallogic.com>"

  layout 'report'

  include SendGrid
  include MailarHelper
  add_template_helper(StatusHelper)

  def send_status(today_statuses, user_email)
    @today_statuses =  today_statuses
    mail_info = {:to => user_email, :subject => "Lime Team Status #{ Time.now.strftime("%dth %B %Y") }"}
    if user_email.eql?(ENG_TEAM_EMAIL)
     mail_info.merge!(:cc => LIME_TEAM_EMAIL)
    end
    Rails.logger.info "Sending mail to #{ user_email }"
    mail(mail_info) do |format|
     format.html {
       render :template =>'user_notifier/send_status.html.erb'
     }
    end
  end

end
