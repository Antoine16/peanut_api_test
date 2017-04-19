class CreditMailer < ApplicationMailer

  def credit_confirmation(credit, user)
    @user = user
    @credit = credit
    mail(to: @user.email, subject: 'Nouveau crédit Peanut!')
  end
end
