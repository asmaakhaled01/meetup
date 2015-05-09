class UserMailer < ApplicationMailer
	default from: "meetup1000@gmail.com"
  def signup_confirmation(user)
	@user = user
    mail to: user.email,subject: "Sign Up confirmation"
  end
end
