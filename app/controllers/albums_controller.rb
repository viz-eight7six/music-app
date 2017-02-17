class AlbumsController < ApplicationController

  def new
    render :new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      render :show
    else
      flash.now[:messages] = @album.errors.full_messages
      render :new
    end

  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def index
    @albums = Album.all
    render :index
  end


  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def destroy

  end

  private
  def album_params
    params.require(:album).permit(:album_name, :album_type)
  end
end
