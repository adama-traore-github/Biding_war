class PaymentMailer < ApplicationMailer
  default from: 'no-reply@auctionsite.com'

  def payment_success_email(user, auction)
    @user = user
    @auction = auction
    mail(to: @user.email, subject: 'Votre paiement a été confirmé')
  end
end
