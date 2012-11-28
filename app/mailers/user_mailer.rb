class UserMailer < ActionMailer::Base
  default from: "sistema.integral@difchihuahua.gob.mx"

  def send_new_office(office)
    @office = office
    mail(to: "#{office.department.user.login}@difchihuahua.gob.mx",
         subject: "Tiene un Oficio Nuevo: #{office.id}, (Prioridad: #{office.priority.name})")
  end
end
