class AttendensController < ApplicationController
  before_action :set_attenden, only: [:show, :edit, :update, :destroy]

  # GET /attendens
  # GET /attendens.json
  def index
    @attendens = Attenden.all
  end

  # GET /attendens/1
  # GET /attendens/1.json
  def show
  end

  # GET /attendens/new
  def new
    @attenden = Attenden.new
  end

  # GET /attendens/1/edit
  def edit
  end

  # POST /attendens
  # POST /attendens.json
  def create
    @attenden = Attenden.new(attenden_params)

    respond_to do |format|
      if @attenden.save
        format.html { redirect_to @attenden, notice: 'Attenden was successfully created.' }
        format.json { render :show, status: :created, location: @attenden }
      else
        format.html { render :new }
        format.json { render json: @attenden.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attendens/1
  # PATCH/PUT /attendens/1.json
  def update
    respond_to do |format|
      if @attenden.update(attenden_params)
        format.html { redirect_to @attenden, notice: 'Attenden was successfully updated.' }
        format.json { render :show, status: :ok, location: @attenden }
      else
        format.html { render :edit }
        format.json { render json: @attenden.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendens/1
  # DELETE /attendens/1.json
  def destroy
    @attenden.destroy
    respond_to do |format|
      format.html { redirect_to attendens_url, notice: 'Attenden was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attenden
      @attenden = Attenden.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attenden_params
      params.require(:attenden).permit(:user_id, :event_id)
    end
end
