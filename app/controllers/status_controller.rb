class StatusController < ApplicationController

  def index
    redirect_to all_status_status_index_path
  end


  def new
    @status = Status.new
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
   if @status.update_attributes(status_params)
     flash[:success] = "Your status has been successfully updated."
     redirect_to status_path(@status, :user => @status.user_email)
   else
     render :action => :edit
   end
 end

 def all_status
   @status_users = Status.joins(:user).where("Date(statuses.created_at) = ?", Date.today)
 end

 def status_report
   @status_users = Status.joins(:user).where("Date(statuses.created_at) = ?", Date.today)
   render :layout => 'report'
 end


# PRIVATE #

  private

  def status_params
    params.require(:status).permit(:user_email, :what_was_done_today, :plan_for_tomorrow, :impediments, :done)
  end

end
