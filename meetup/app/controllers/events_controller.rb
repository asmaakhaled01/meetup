class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

def attend
    @event = Event.find(params[:event_id])
    @attend = Attenden.new(:user_id => params[:user_id], :event_id => params[:event_id])
    @attend.save
    redirect_to @event
end

def calender

end 

def find
end
 
  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    event_id=params[:id]
    @num_attendens= Attenden.where(:event_id => event_id).count
    if logged_in?
      user_id=current_user.id
      @attenden = Attenden.find_by(user_id: user_id ,event_id: event_id)
      if @attenden
        @flag_attend=0
      else 
        @flag_attend=1
      end
    else
      @flag_attend=0  
    end  
    @comments  = Comment.where("event_id = ? ", event_id );
    @event = Event.find(event_id)
  end

  # GET /events/new
  def new
    @group_id=params[:group_id]
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)


    users = Member.where( :group_id =>  @event.group_id )

    users.each do|n|
       @val= User.find(n.user_id)
       UserMailer.event_creation(@val,@event).deliver
    end

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :desc, :location, :date, :group_id , :ev_image , :user_id)
    end
end
