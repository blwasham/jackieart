class PaintingsController < ApplicationController

  def index
    @painting = Painting.new
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @paintings }
    end
  end

  def load
    @paintings = Painting.all
    
    respond_to do |format|
      format.json
    end
  end

  def show
    @painting = Painting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @painting = Painting.new

    respond_to do |format|
      format.html { render :index }
    end
  end

  def edit
    @painting = Painting.find(params[:id])
    
    respond_to do |format|
      format.html { render :index }
    end
  end

  def create
    @painting = Painting.new(params[:painting])
    
    if params[:image_name].present?
      preloaded = Cloudinary::PreloadedFile.new(params[:image_name])         
      raise "Invalid upload signature" if !preloaded.valid?
      params[:painting][:image_name] = preloaded.identifier
    end
binding.pry
    respond_to do |format|
      if @painting.save
        format.html { redirect_to paintings_path, notice: 'Painting was successfully created.' }
      else
        format.html { render :index }
      end
    end
  end

  def update
    @painting = Painting.find(params[:id])

    respond_to do |format|
      if @painting.update_attributes(params[:painting])
        format.html { redirect_to paintings_path, notice: 'Painting was successfully updated.' }
      else
        format.html { render :index }
      end
    end
  end

  def destroy
    @painting = Painting.find(params[:id])
    @painting.destroy

    respond_to do |format|
      format.html { redirect_to :index }
    end
  end
end
