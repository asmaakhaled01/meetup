class UserMailer < ApplicationMailer
	default from: "meetup1000@gmail.com"

  def event_creation(user,event)
	@user = user
	@event = event
    mail to: user.email,subject: "New Event Created"
  end

    
  def signup_confirmation(user)
	@user = user
    mail to: user.email,subject: "Sign Up confirmation"
  end

end
