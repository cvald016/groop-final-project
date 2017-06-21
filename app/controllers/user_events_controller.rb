class UserEventsController < ApplicationController
  before_action :set_user_event, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user
<<<<<<< HEAD
=======
  # before_action :no_access
  # after_action :create_message, only: [:create]

>>>>>>> 7b03de17190e33b92fae4bdd7206ca0f00905f33

  # GET /user_events
  # GET /user_events.json
  def index
    @user_events = UserEvent.all
    redirect_to events_url
  end

  # GET /user_events/1
  # GET /user_events/1.json
  def show
    redirect_to events_path
  end

  # GET /user_events/new
  def new
    @user_event = UserEvent.new
  end

  # GET /user_events/1/edit
  def edit
    redirect_to events_path
  end


  # POST /user_events
  # POST /user_events.json


  def create
<<<<<<< HEAD
    if (Event.find_by(id: user_event_params[:event_id]).creator_id == current_user.id) || (Event.find(user_event_params[:event_id]).user_events.where(user_id: current_user.id).any?)
      redirect_to event_path(user_event_params[:event_id]), notice: 'You are already in this groop!'
      return
    else
      @user_event = UserEvent.new(user_event_params)
      MessageSender.send_message(message)
    end
=======
    @user_event = UserEvent.new(user_event_params)
    
>>>>>>> 7b03de17190e33b92fae4bdd7206ca0f00905f33
    respond_to do |format|
      if @user_event.save
        format.html { redirect_to @user_event.event, notice: 'You have joined this groop!' }
        format.json { render :show, status: :created, location: @user_event }
      else
        format.html { render :new }
        format.json { render json: @user_event.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /user_events/1
  # PATCH/PUT /user_events/1.json
  def update
    respond_to do |format|
      if @user_event.update(user_event_params)
        format.html { redirect_to @user_event.event, notice: 'User event was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_event }
      else
        format.html { render :edit }
        format.json { render json: @user_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_events/1
  # DELETE /user_events/1.json
  def destroy
    @user_event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'You have left this groop!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def message
<<<<<<< HEAD
      "Great news! #{current_user.full_name} joined your event, #{Event.find(user_event_params[:event_id]).title}!"
=======
      "Testing Twilio Feature!"
>>>>>>> 7b03de17190e33b92fae4bdd7206ca0f00905f33
    end

    def set_user_event
      @user_event = UserEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_event_params
      params.require(:user_event).permit(:user_id, :event_id)
    end

end
