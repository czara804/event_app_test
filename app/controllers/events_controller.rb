class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_event, only: [:edit, :update, :destroy]
  before_action :authorise_user!, only: [:update, :edit, :destroy]
  

  def index
    @events = Event.all
  end

  def show
    @event = Event.includes(attendances:[:user]).find(params[:id])
  end 

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    
    if @event.save 
      redirect_to @event
    else 
      render new 
    end 
  end

  def edit
  end
  
  def update
    if @event.update(event_params)
      redirect_to @event
    else 
      render :edit
    end 
  end
  
  def destroy
    @event.delete

    redirect_to events_path
  end

  private
  def event_params
    params.require(:event).permit(:name, :location, :notes)
  end

  def find_event
    @event = Event.find(params[:id])
  end

  def authorise_user!
    return true if current_user.id == @event.user_id
    
  end
end
