class UserMailer < ApplicationMailer
<<<<<<< HEAD
    default from: 'votre-adresse-email@example.com'
  
    def welcome_email(user)
      @user = user
      @url  = 'http://votre-site.com/login'
      mail(to: @user.email, subject: 'Bienvenue sur notre site !')
    end
  end
  
=======
  default from: 'no-reply@auctionsite.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Bienvenue sur AuctionSite')
  end
end
>>>>>>> 971f24985a6ceac6209dea3aecf3bf93b63a5c73
