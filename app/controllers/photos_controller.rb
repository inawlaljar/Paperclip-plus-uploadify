class PhotosController < ApplicationController
  def index
    @photos = Product.all(:limit => 10)
  end 
  
  def new
    @photo = Product.new(:attachable_id => params[:id])
 end
  
  def show
    @photo = Photo.find(params[:id])    
  end
  
  def create 
    #newparams = coerce(params) 
    @photo = Photo.new(params[:photo])  
    
    #@parent = @photo.parent.constantize.find(@photo.attachable_id) 
    if @photo.save
      flash[:notice] = "Successfully uploaded photo."
      respond_to do |format| 
        format.html {redirect_to @photo} 
        format.json  { render :json => { :result => 'success', :photo => photo_path(@photo) } } 
      end 
    else
      flash[:notice] = "Only gif, jpg or png files allowed"
      respond_to do |format| 
        format.html {redirect_to @photo} 
        format.json  { render :json => { :result => 'failed'} } 
      end
    end
 
  end
 

 
  def coerce(params) 
    if params[:upload].nil? 
      h = Hash.new 
      h[:upload] = Hash.new 
      h[:upload][:attachable_id] = params[:attachable_id] 
      h[:upload][:parent] = params[:parent] 
      h[:upload][:data] = params[:Filedata] 
      h[:upload][:data].content_type =  MIME::Types.type_for(h[:upload][:data].original_filename).to_s 
      h 
    else 
      params 
    end 
  end
end
