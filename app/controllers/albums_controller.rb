class AlbumsController < ApplicationController
 def index
    @albums = Album.find(:all)
  end
  
  def show
    @album = Album.find(params[:id])
    @photo = Photo.new(:attachable_id => @album.id)
  end
  
  def new
    @album = Album.new
  end
  
  def create
    @album = Album.new(params[:album])
    if @album.save
      flash[:notice] = "Successfully created category."
      redirect_to @album
    else
      render :action => 'new'
    end
  end
  
  def edit
    @album = Album.find(params[:id])
  end
  
  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(params[:album])
      flash[:notice] = "Successfully updated category."
      redirect_to @album
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    flash[:notice] = "Successfully destroyed category."
    redirect_to albums_url
  end
end
