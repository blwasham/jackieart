class PaintingsController < ApplicationController
  before_action :set_painting, only: [:show, :edit, :update, :destroy]

  # GET /paintings
  # GET /paintings.json
  def index
    @painting = Painting.new
  end

  # GET /paintings/1
  # GET /paintings/1.json
  def show
  end

  # GET /paintings/new
  def new
    @painting = Painting.new
  end

  # GET /paintings/1/edit
  def edit
  end  

  # POST /paintings
  # POST /paintings.json
  def create
    @painting = Painting.new(painting_params)

    if params[:image_name].present?

      preloaded = Cloudinary::PreloadedFile.new(params[:image_name])         
      raise "Invalid upload signature" if !preloaded.valid?
      params[:painting][:image_name] = preloaded.identifier
    end

    respond_to do |format|
      if @painting.save
        format.html { redirect_to paintings_path, notice: 'Painting was successfully created.' }
      else
        format.html { render :index }
      end
    end
  end

  # PATCH/PUT /paintings/1
  # PATCH/PUT /paintings/1.json
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

  # DELETE /paintings/1
  # DELETE /paintings/1.json
  def destroy
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
  
private
  def set_painting
    @painting = Painting.find(params[:id])
  end
  
  def painting_params
    params.require(:painting).permit(:name, :description, :price, :position, :image_name, :featured)
  end
end
