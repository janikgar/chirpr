class ChirpsController < ApplicationController
  before_action :set_chirp, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!

  include ChirpsHelper

  # GET /chirps
  # GET /chirps.json
  def index
    @chirps = Chirp.all
    redirect_to root_path
  end

  # GET /chirps/1
  # GET /chirps/1.json
  def show
    redirect_to root_path
  end

  # GET /chirps/new
  def new
    @chirp = Chirp.new
  end

  # GET /chirps/1/edit
  def edit
    # TODO: when we edit chirps, make sure the hashtags are added too!

    # @chirp = :chirp
    # @chirp = get_tagged(@chirp)
  end

  # POST /chirps
  # POST /chirps.json
  def create
    @chirp = Chirp.create(chirp_params)

    @chirp = get_tagged(@chirp)

    respond_to do |format|
      if @chirp.save
        format.html { redirect_to @chirp, notice: 'Chirp was successfully created.' }
        format.json { render :show, status: :created, location: @chirp }
      else
        format.html { render :new }
        format.json { render json: @chirp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chirps/1
  # PATCH/PUT /chirps/1.json
  def update
    respond_to do |format|
      if @chirp.update(chirp_params)
        format.html { redirect_to @chirp, notice: 'Chirp was successfully updated.' }
        format.json { render :show, status: :ok, location: @chirp }
      else
        format.html { render :edit }
        format.json { render json: @chirp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chirps/1
  # DELETE /chirps/1.json
  def destroy
    @chirp.destroy
    respond_to do |format|
      format.html { redirect_to chirps_url, notice: 'Chirp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chirp
      @chirp = Chirp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chirp_params
      params.require(:chirp).permit(:message, :user_id, :link)
    end
end
