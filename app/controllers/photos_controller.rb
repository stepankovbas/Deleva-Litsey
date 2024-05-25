class PhotosController < ApplicationController
    
    before_action :set_album
    before_action :set_photo, only: [:show, :edit, :update, :destroy]
    
  
    def index
      @photos = @album.photos
    end
  
    def show
    end
  
    def new
      @photo = @album.photos.build
    end
  
    def create
      @photo = @album.photos.build(photo_params)
      if @photo.save
        redirect_to [@album, @photo], notice: 'Photo was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @photo.update(photo_params)
        redirect_to [@album, @photo], notice: 'Photo was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @photo.destroy
      redirect_to album_photos_path(@album), notice: 'Photo was successfully destroyed.'
    end
  
    private
  
    def set_album
      @album = Album.find(params[:album_id])
    end
  
    def set_photo
      @photo = @album.photos.find(params[:id])
    end
  
    def photo_params
      params.require(:photo).permit(:image)
    end
  end
  