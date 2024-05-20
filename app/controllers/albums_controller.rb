class AlbumsController < ApplicationController
    def index
      @albums = Album.all
    end
  
    def show
      @album = Album.find(params[:id])
    end
  
    def new
      @album = Album.new
    end
  
    def create
      @album = Album.new(album_params)
      if @album.save
        redirect_to @album, notice: 'Альбом створено успішно.'
      else
        render :new
      end
    end
  
    def edit
      @album = Album.find(params[:id])
    end
  
    def update
      @album = Album.find(params[:id])
      if @album.update(album_params)
        redirect_to @album, notice: "Альбом оновлено."
      else
        render :edit
      end
    end
  
    def destroy
      @album = Album.find(params[:id])
      @album.destroy
      redirect_to albums_url, notice: 'Альбом видалено успішно.'
    end
  
    private
  
    def album_params
      params.require(:album).permit(:title, :description, :cover_image, photos: [])
    end
end
  