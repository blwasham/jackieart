class PaintingsController < ApplicationController
  before_action :set_painting, only: [:show, :edit, :update, :destroy]

  def index
    @painting = Painting.new
  end

  def show
  end

  def new
    @painting = Painting.new
  end

  def edit
  end  

  def create
    @painting = Painting.new(painting_params)
    
    if params[:painting][:image_name].present?
      preloaded = Cloudinary::PreloadedFile.new(params[:painting][:image_name])         
      raise "Invalid upload signature" if !preloaded.valid?
      @painting.image_name = preloaded.filename
    end

    respond_to do |format|
      if @painting.save
        format.html { redirect_to paintings_path, notice: 'Painting was successfully created.' }
      else
        format.html { render :index }
      end
    end
  end

  def update
    respond_to do |format|
      if @painting.update(painting_params)
        format.html { redirect_to @painting, notice: 'Painting was successfully updated.' }
        format.json { render :show, status: :ok, location: @painting }
      else
        format.html { render :index }
        format.json { render json: @painting.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    f = File.basename(@painting.image_name,File.extname(@painting.image_name))
    Cloudinary::Uploader.destroy(f)
    @painting.destroy
    respond_to do |format|
      format.html { redirect_to paintings_url, notice: 'Painting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def load
    @paintings = Painting.all
    
    respond_to do |format|
      format.json
    end
  end
  
  def reorder
    @painting.insert_at(params[:position].to_i)
    render json: {}
  end
  
private
  def set_painting
    @painting = Painting.find(params[:id])
  end
  
  def painting_params
    params.require(:painting).permit(:name, :description, :price, :position, :image_name, :featured)
  end
end
