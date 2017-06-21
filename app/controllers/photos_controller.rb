class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :destroy]
  before_action :find_event, only: [:index, :new, :create]

  def index
      @photos = @event.photos
   end

   def show
   end

   def new
      @photo = @event.photos.new
   end

   def create
      @photo = @event.photos.new(photo_params)

      if @photo.save
         redirect_to event_path(@event.id), notice: "Your photo has been uploaded!"
      else
         render "new"
      end

   end

   def destroy
      @photo.destroy
      redirect_to photo_path, notice:  "The photo #{@photo.name} has been deleted."
   end

   private

    def set_photo
      @photo = Photo.find(params[:id])
    end

    def find_event
      @event = Event.find(params["event_id"])
    end

    def photo_params
      params.require(:photo).permit(:name, :attachment, :event_id)
    end
end
