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
      flash[:success] = "Your status has been successfully added."
      redirect_to status_path(@status, :user => @status.user_email)
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
   #debugger
   if @status.update_attributes(status_params)
     flash[:success] = "Your status has been successfully updated."
     redirect_to status_path(@status, :user => @status.user_email)
   else
     render :action => :edit
   end
 end

 def all_status
   @users_status = Status.joins(:user).where("Date(statuses.created_at) = ?", Date.today)
 end

 def status_report
   @users_status = Status.joins(:user).where("Date(statuses.created_at) = ?", Date.today)
   render :layout => 'report'
 end

 def notify_status
   @users_status = Status.joins(:user).where("Date(statuses.created_at) = ?", Date.today)
   UserNotifier.send_status(@users_status).deliver
   render :text => "successfully sent!!"
 end

# PRIVATE #

  private

  def status_params
    params.require(:status).permit(:user_email,
                                   :impediments,
                                   :done,
                                   :today_tasks_attributes    => [:id, :name, :description, :task_type],
                                   :tomorrow_tasks_attributes => [:id, :name, :description, :task_type]
    )
  end

end
