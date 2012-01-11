class ProductsController < ApplicationController
  def index
    @products = Product.all(:limit => 10)
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def new
    @product = Product.new
  end
  
  def create
    newparams = coerce(params) 
    @product = Product.new(newparams[:product]) 
   
    if @product.save
      flash[:notice] = "Successfully created product."
      redirect_to @product
    else
      render :action => 'new'
    end
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      flash[:notice] = "Successfully updated product."
      redirect_to @product
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Successfully destroyed product."
    redirect_to products_url
  end

  private 
  def coerce(params) 
    if params[:product].nil? 
      h = Hash.new 
      h[:product] = Hash.new 
      h[:product][:category_id] = params[:category_id] 
      h[:product][:parent] = params[:parent] 
      h[:product][:data] = params[:Filedata] 
      h[:product][:data].content_type =  MIME::Types.type_for(h[:product][:data].original_filename).to_s 
      h 
    else 
      params 
    end 
  end
end
