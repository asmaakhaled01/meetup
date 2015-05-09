class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  
  def join
    @group = Group.find(params[:group_id])
    @member = Member.new(:user_id => params[:user_id], :group_id => params[:group_id])
    @member.save
    redirect_to @group
  end

  # GET /groups
  def index
    @groups = Group.all
  end

  # GET /groups/1
  def show
    group_id=params[:id]
    @num_members= Member.where(:group_id => group_id).count
    if logged_in?
      user_id=current_user.id
      @member = Member.find_by(user_id: user_id ,:group_id => group_id )
      if @member
        @flag_join=0
      else 
        @flag_join=1
      end
    else
      @flag_join=0  
    end  
    @group = Group.find(group_id)
    @events = (Event.where(:group_id => group_id)).order("date") 
  end

  # GET /groups/new
  def new
    if logged_in?
      @group = Group.new
    else
      flash[:danger] = 'Please Login first'
      redirect_to login_path
    end  
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

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
      params.require(:group).permit(:name, :location, :user_id, :g_image)
    end
end
