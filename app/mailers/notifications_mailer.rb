class NotificationsMailer < ActionMailer::Base
  default from: "notifications@parisoma.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications_mailer.email_confirmation.subject
  #
  def email_confirmation(user)
    @user = user
    mail to: @user.email, :subject => "Please confirm your email address"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @user = user
    mail to: @user.email, :subject => "Account confirmation"
  end
end
