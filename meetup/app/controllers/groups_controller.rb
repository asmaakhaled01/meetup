class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]


def join
# join logic rediect to current group
end
  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end



def create 
  @group = Group.new(group_params) 
  @inter = Interest.new(interest_params) 
  puts "------------------------------"
  puts @inter['interest']
  group_id=Group.last.id 
  
  array = @inter['interest'].split(/, /)
    array.size.times do |i|
    @interst_group=Interest.new(:group_id=> group_id,:interest=> array[i])
    @interst_group.save
  end 

  
   if @group.save 
    redirect_to @group 
  else render 'new' 
  end 
end


  # POST /groups
  # POST /groups.json
  # def create

  #     @group = Group.new(group_params)

  #     @interest = Interest.new(interest_params)

  #   respond_to do |format|
  #     if @group.save
  #       format.html { redirect_to @group, notice: 'Group was successfully created.' }
  #       format.json { render :show, status: :created, location: @group }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @group.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :location, :user_id, :g_image , :description , :MembersName)
    end

    def interest_params
      params.require(:interest).permit(:interest) 
    end
end
