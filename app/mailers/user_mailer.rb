class UserMailer < ActionMailer::Base
  default from: "adminteam@rottenmangoes.com"

  def user_delete_notification(user)
    @user = user
    mail(to: @user.email, subject: "Account Deletion Yo!")
  end
end
