class LeavesController < ApplicationController
  
before_action :authenticate_user!
  def index
  gon.date = current_user.date_of_joining
  @leaves = Leave.all

  end
  
  def new
    @leave = current_user.leaves.build
  end

  def show
     @leave = Leave.find(params[:id])
  end

  def create
     @leave = current_user.leaves.build(user_params) 
     if @leave.save
       redirect_to leave_path(@leave)
     else
       render 'new'
     end
  end

  def update
  end

  def destroy
  end

  
private
    def user_params
     params.require(:leave).permit(:from_date, :to_date, :reason, :type_of_leave, :no_of_days )                                       
    end
end
