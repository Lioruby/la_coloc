class UserMailer < ApplicationMailer
  default from: "xyz.lacoloc@gmail.com"

  def welcome(user)
    @user = user
    mail(to: user.email, subject: "This is a nice welcome email")
  end

  def invitation(user:, email:, colocation:)
    @user = user
    @email = email
    @colocation = colocation
    mail(to: @email, subject: "#{@user.first_name} vous invite à rejoindre #{@user.colocation.name}")
  end
end
