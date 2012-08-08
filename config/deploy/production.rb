set :deploy_to, "/webapps/#{application}"
set :domain, "148.229.10.138" #sistema.difchihuahua.gob.mx
set :user, "rgonzalez"     #creyes, cfgarcia
set :rails_env, "production"

#after "deploy:cleanup"