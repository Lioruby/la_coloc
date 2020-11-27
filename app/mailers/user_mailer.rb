class UserMailer < ApplicationMailer
  default from: "xyz.lacoloc@gmail.com"

  def welcome(user)
    @user = user
    mail(to: user.email, subject: "This is a nice welcome email")
  end
end
