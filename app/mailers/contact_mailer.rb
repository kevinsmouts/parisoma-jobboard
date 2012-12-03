class ContactMailer < ActionMailer::Base
  default from: "kevin@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact.subject
  #
  def contact(params)

    @email = params[:contact][:email]
    @subject = params[:contact][:subject]
    if @subject != ""
      divider = " - "
    else
      divider = ""
    end
    @content = params[:contact][:content]

    mail to: "kevin@parisoma.com", :subject => @subject+divider+"PARISOMA Job Board Contact Form"
  end
end
