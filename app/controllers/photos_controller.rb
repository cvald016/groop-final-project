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
         redirect_to photos_path, notice: "The photo #{@photo.name} has been uploaded."
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
