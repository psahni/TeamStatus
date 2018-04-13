class UserNotifier < ApplicationMailer

  default :from => "prashantkumar.sahni@globallogic.com"
  layout 'report'

  include SendGrid
  include MailarHelper
  add_template_helper(StatusHelper)

  def send_status(today_statuses, risk_documents, user_email)
    @today_statuses =  today_statuses
    @risk_documents =  risk_documents

    mail_info = {:to => user_email, :subject => "Lime Team Status #{ Time.now.strftime("%dth %B %Y") }"}

    Rails.logger.info "Sending mail to #{ user_email }"
    # Mail triggers from here
    mail(mail_info) do |format|
     format.html {
       render :template =>'user_notifier/send_status.html.erb'
     }
    end
  end

end
