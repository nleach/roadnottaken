class LegsController < ApplicationController
  before_action :set_leg, only: [:show, :edit, :update, :destroy]

  def waypoint_up
    if params[:waypoint]
      if waypoint = Waypoint.find(params[:waypoint])
        waypoint.sort_flag += 1
        waypoint.save!
      end
    end
  end
  
  def waypoint_down
    if params[:waypoint]
      if waypoint = Waypoint.find(params[:waypoint])
        waypoint.sort_flag -= 1
        waypoint.save!
      end
    end
  end

  # GET /legs
  # GET /legs.json
  def index
    @legs = Leg.all
  end

  # GET /legs/1
  # GET /legs/1.json
  def show
    @location = Location.new
    if @leg.locations 
      @leg_hash = Gmaps4rails.build_markers(@leg.locations) do |location, marker|
        marker.lat location.latitude
        marker.lng location.longitude
        marker.title location.address
      end    
    else
      @leg_hash = nil
    end
     
  end

  # GET /legs/new
  def new
    @leg = Leg.new
  end

  # GET /legs/1/edit
  def edit
  end

  # POST /legs
  # POST /legs.json
  def create
  
    @leg = Leg.new(leg_params)

    respond_to do |format|
      if @leg.save
        format.html { redirect_to @leg, notice: 'Leg was successfully created.' }
        format.json { render :show, status: :created, location: @leg }
      else
        format.html { render :new }
        format.json { render json: @leg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /legs/1
  # PATCH/PUT /legs/1.json
  def update
    respond_to do |format|
      if @leg.update(leg_params)
        format.html { redirect_to @leg, notice: 'Leg was successfully updated.' }
        format.json { render :show, status: :ok, location: @leg }
      else
        format.html { render :edit }
        format.json { render json: @leg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /legs/1
  # DELETE /legs/1.json
  def destroy
    @leg.destroy
    respond_to do |format|
      format.html { redirect_to legs_url, notice: 'Leg was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leg
      @leg = Leg.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def leg_params
      params.require(:leg).permit(:title, :description, :trip_id)
    end
end
