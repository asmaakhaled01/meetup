class SessionsController < ApplicationController
  def new
    if logged_in?
      flash[:success] = 'You are already logged_in' # Not quite right!    
      redirect_to current_user
    end
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase , password: params[:session][:password])
    if @user
      # Log the user in and redirect to the user's show page.
      log_in @user
      flash[:success] = 'Welcome' # Not quite right!
      redirect_to @user
    else
      # Create an error message.
       flash[:danger] = 'Invalid email/password combination' # Not quite right!
       render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
  
end
