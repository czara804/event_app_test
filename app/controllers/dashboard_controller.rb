class DashboardController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @events = Event.where(user_id: current_user.id)
    @attendances = Attendance.where(user_id: current_user.id)
  end
end
