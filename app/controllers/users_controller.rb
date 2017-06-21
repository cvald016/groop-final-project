class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :show, :edit, :update]


  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @events = Event.all

    @my_events = @events.select do |event|
      event.date >= DateTime.now && event.creator_id == @user.id
    end

    @my_attending_events = UserEvent.joins(:event).where("user_id == :user AND events.date >= :current_event_date",
      {user: @user.id, current_event_date: DateTime.now})

    # All the current events you are involved in
    @all_current_events = @my_events + user_events(@my_attending_events)

    @my_past_events = @events.select do |event|
      event.date < DateTime.now && event.creator_id == @user.id
    end

    @past_attending_events = UserEvent.joins(:event).where("user_id == :user AND events.date < :current_event_date",
      {user: @user.id, current_event_date: DateTime.now})

    @all_past_events = @my_past_events + user_events(@past_attending_events)
  end

  # GET /users/new
  def new
    # @user = User.new
    redirect_to events_path
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:full_name)
    end

end
