class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :show, :edit, :update]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    # Past Events that you and your friends held
    @past_events = @events.select do |event|
      event.date < DateTime.now
    end

    # Current Events that you created
    @my_events = @events.select do |event|
      event.date >= DateTime.now && event.creator_id == current_user.id
    end

    # Current Events that you are attending
    @attending_events = UserEvent.joins(:event).where("user_id == :current_user AND events.date >= :current_event_date",
      {current_user: current_user.id, current_event_date: DateTime.now})

    # All the current events you are involved in
    @all_attending_events = @my_events + user_events(@attending_events)

    # Friend made events show all events not created by you
    @friend_made_events = @events.select do |event|
      event.date >= DateTime.now && event.creator_id != current_user.id
    end

     # Events made by your friends, where you are not attending
     @friend_events = @friend_made_events - user_events(@attending_events)
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @photo = Photo.find(1)
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
<<<<<<< HEAD
    if event_params[:date] < DateTime.now
      redirect_to events_path, notice: 'Unable to make an event in the past.'
      return
    else
      @event = current_user.events.build(event_params)
      @event.creator_id = current_user.id

      respond_to do |format|
        if @event.save!
          format.html { redirect_to @event, notice: 'Event was successfully created.' }
          format.json { render :show, status: :created, location: @event }
        else
          render 'new'
          # format.json { render json: @event.errors, status: :unprocessable_entity }
        end
=======
    @event = current_user.events.build(event_params)
    @event.creator_id = current_user.id
    respond_to do |format|
      if @event.save!
        p @event.id, "it worked!!"
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
>>>>>>> 7b03de17190e33b92fae4bdd7206ca0f00905f33
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
