class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :show, :edit, :update]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    # Past Events that you and your friends held.
    @past_events = Event.where("date < :current_date",
      {current_date: DateTime.now.strftime("%Y-%m-%dT%H:%M")})

    # Current Events that you created
    @my_events = Event.where("creator_id == :current_user AND date >= :current_date", 
      {current_user: current_user.id, current_date: DateTime.now.strftime("%Y-%m-%dT%H:%M")})
    
    # For the current_event_date condition, we can also user Time.now.utc_beginning_of_day
    # Current Events that you are attending
    @attending_events = UserEvent.joins(:event).where("user_id == :current_user AND events.date >= :current_event_date",
      {current_user: current_user.id, current_event_date: DateTime.now.strftime("%Y-%m-%dT%H:%M")})

    # All the current events you are involved in
    @all_attending_events = @my_events + user_events(@attending_events)

    # Events you are not attending and you didn't create
    @friends_userevents = UserEvent.joins(:event).where("user_id != :current_user AND date >= :current_date AND events.creator_id != :current_user", 
      {current_user: current_user.id, current_date: DateTime.now.strftime("%Y-%m-%dT%H:%M")})

    # Changes your friends' groops to their events!
    @friends_events = user_events(@friends_userevents)

  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
    @current_date = DateTime.now.strftime("%Y-%m-%dT%H:%M")
  end
  
  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = current_user.events.build(event_params)
    @event.creator_id = current_user.id
    respond_to do |format|
      if @event.save!
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :date, :location, :description)
    end
end
