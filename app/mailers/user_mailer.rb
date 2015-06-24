class UserMailer < ActionMailer::Base
  default from: "ruby@brianli.ca"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.delete_notification.subject
  #
  def created_account_notification(user)
    @user = user
    mail to: @user.email, subject: "#{@user.firstname} #{@user.lastname}, Your account has been created"
  end

   def deleted_account_notification(user)
    @user = user
    mail to: @user.email, subject: "#{@user.firstname} #{@user.lastname}, Your account has been deleted"
  end
end
