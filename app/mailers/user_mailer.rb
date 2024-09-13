class UserMailer < ApplicationMailer
  default from: 'no-reply@auctionsite.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Bienvenue sur AuctionSite')
  end
end
