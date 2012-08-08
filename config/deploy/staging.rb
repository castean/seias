set :deploy_to, "/webapps/#{application}"
set :domain, "labs.ti.uach.mx" #labs.ti.uach.mx - 148.229.1.28
set :user, "rgonzalez"     #creyes, cfgarcia
set :rails_env, "staging"

#after "deploy:cleanup"