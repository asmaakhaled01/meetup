class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy ]
 skip_before_action :verify_authenticity_token



def search
   
  @events = Event.where("date > ?", params[:date])
    render partial: 'find'
  
end


  def calender
  end


  # GET /users
  def index
    if logged_in?
      if current_user.is_admin == true
        @users = User.all
      else
        redirect_to root_url    
      end
    else
      redirect_to root_url  
    end  
end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @flag=0  #display password field in from
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @flag=1 #hidden password field from from
  end

  # POST /users
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        UserMailer.signup_confirmation(@user).deliver
        format.html { redirect_to login_path }
        flash[:success] = 'User was successfully created.' # Not quite right!
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user }
        flash[:success] = 'User was successfully updated.' # Not quite right!
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  def destroy
    #delete members
    groups = Group.where(:user_id => @user.id)
    puts "=========================================oooo"
    groups.each do |group|
      Event.where(:group_id => group.id).destroy_all

      Member.where(:group_id => group.id).destroy_all
      Interest.where(:group_id => group.id).destroy_all
    end 
    
    Group.where(:user_id => @user.id).destroy_all
    
    Member.where(:user_id => @user.id).destroy_all
    Event.where(:user_id => @user.id).destroy_all
    Attenden.where(:user_id => @user.id).destroy_all

    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      flash[:success] = 'User was successfully updated.'
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :is_admin , :image)
    end
  end
