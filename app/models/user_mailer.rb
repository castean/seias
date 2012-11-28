class UserMailer < ActiveRecord::Base
  has_many :offices
  def weekly_mail(email)
    mail(:to => email, :subject => "Tiene un Oficio Pendiente")
  end

  # attr_accessible :title, :body
end
