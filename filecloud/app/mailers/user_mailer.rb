class UserMailer < ActionMailer::Base
  default from: "dangkhanhit@gmail.com"

  def welcome_email(user)
    @user = user
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end
end
