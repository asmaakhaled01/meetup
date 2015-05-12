class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token
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



def create 
  puts  "***********************************"
  puts  params[:lat]
  puts  params[:lang] 
  puts  "***********************************"
  @group = Group.new(group_params) 
  @inter = Interest.new(interest_params) 

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
    # delete event
    Event.where(:group_id => @group.id).destroy_all
    # delete members
    Member.where(:group_id => @group.id).destroy_all
    Interest.where(:group_id => @group.id).destroy_all
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def find
  
  @interest = params[:interest];
  @search_options =  params[:option];
  @search_text =  params[:search_text];
  if ! ['any'].include?(@interest)
      @interests  = Interest.select('group_id').where("interest = ? ", @interest );
      if @interests.length >= 1       
        groups_ids = Array.new
        @interests.each do |title|
          groups_ids.push(title.group_id)
        end
        if ['1', '3', '5'].include?(@search_options)
          @groups = Group.near([params[:lat], params[:long]], @search_options).where("id in (?) ", groups_ids );
        else
          @groups = Group.where("id in (?) ", groups_ids );
        end  
      else 
        @groups = Group.near([params[:lat], params[:long]], @search_options).where("name like ?", '%'+@search_text+'%')  
      end  
  elsif ['1', '3', '5'].include?(@search_options)
    @groups = Group.near([params[:lat], params[:long]], @search_options).where("name like ?", '%'+@search_text+'%')
  else
    @groups = Group.where("name like ?", '%'+@search_text+'%')
  end 
  render partial: "find";
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :location, :user_id, :g_image , :description , :MembersName , :lat ,:lang)
    end

    def interest_params
      params.require(:interest).permit(:interest) 
    end
end
