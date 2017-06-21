class PhotosController < ApplicationController
  def index
      @photos = Photo.all
   end

   def show
     @photo = Photo.last  #TODO might need to delete
   end

   def new
      @photo = Photo.new
   end

   def create
      @photo = Photo.new(photo_params)

      if @photo.save
<<<<<<< HEAD
         redirect_to event_path(Event.find(1))
=======
         redirect_to photos_path, notice: "The photo #{@photo.name} has been uploaded."
>>>>>>> 7b03de17190e33b92fae4bdd7206ca0f00905f33
      else
         render "new"
      end

   end

   def destroy
      @photo = Photo.find(params[:id])
      @photo.destroy
      redirect_to photo_path, notice:  "The photo #{@photo.name} has been deleted."
   end

   private
      def photo_params
      params.require(:photo).permit(:name, :attachment)
   end
end
