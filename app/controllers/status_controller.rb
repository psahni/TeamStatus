class StatusController < ApplicationController

  #skip_before_filter :verify_authenticity_token, :only => [:notify_status]

  def index
    redirect_to all_status_status_index_path
  end

  def new
    @status = Status.new
    @status.today_tasks.build
    @status.tomorrow_tasks.build
  end

  def create
    @status = Status.new(status_params)
    if @status.save
      session[:status_id] = @status.id
      flash[:success] = "Your status has been successfully added."
      redirect_to status_path(@status)
    else
      render :action => :new
    end
  end

  def show
    @status = Status.find(params[:id])
  end

 def edit
   @status = Status.find(params[:id])
 end

 def update
   @status = Status.find(params[:id])
   if @status.update_attributes(status_params)
     flash[:success] = "Your status has been successfully updated."
     redirect_to status_path(@status)
   else
     render :action => :edit
   end
 end

def destroy
  @status = Status.find(params[:id])
  if @status.destroy
    redirect_to status_report_status_path
  end
end

#-----------------------------------------------------------------------------------------

  def all_status
   @users_status = Status.joins(:user).where("Date(statuses.created_at) = ?", Date.today)
  end

#-----------------------------------------------------------------------------------------

  def status_report
   @today_statuses = Status.fetch_today_statuses
   if params[:email_view] == '1'
     render :template => 'status/status_report_email.html.erb'
   end
  end

#-----------------------------------------------------------------------------------------

  def prev_status
    diff = params[:diff].to_i
    @today_statuses = Status.fetch_prev_day_statuses(diff)
    render :template => 'status/status_report.html.erb'
  end

#-----------------------------------------------------------------------------------------

  def notify_status
   @today_statuses = Status.fetch_today_statuses
   @email_notification = EmailNotification.new(params[:email])
     if @email_notification.valid?
       UserNotifier.send_status(@today_statuses,  @email_notification.email).deliver
       redirect_to status_report_status_index_path
    else
      render :action => :status_report
    end
  end

#---------------------------------------------------------------------------------------------

# PRIVATE #

  private

  def status_params
    params.require(:status).permit(:user_email,
                                   :impediments,
                                   :done,
                                   :tracker_updated,
                                   :today_tasks_attributes    => [:id, :name, :description, :task_type, :_destroy],
                                   :tomorrow_tasks_attributes => [:id, :name, :description, :task_type, :_destroy]
    )
  end

end
