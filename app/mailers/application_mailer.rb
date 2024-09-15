class ApplicationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.application_mailer.order_mailer.subject
  #
  def order_mailer
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
