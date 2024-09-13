class FaqMailer < ApplicationMailer
  default from: 'no-reply@auctionsite.com'

  def faq_question_email(user, question)
    @user = user
    @question = question
    mail(to: 'support@auctionsite.com', subject: 'Nouvelle question de FAQ')
  end
end
