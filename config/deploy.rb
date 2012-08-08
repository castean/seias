set :stages, %w(staging production)
set :default_stage, "production"
require 'capistrano/ext/multistage'


set :application, "seias"
set :repository,  "gitosis@labs.ti.uach.mx:seias.git"

set :deploy_to, "/webapps/#{application}"
set :use_sudo, false

ssh_options[:forward_agent] = true

#Solo guarde las ultimas 5 deploys
set :keep_releases, 5

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

# Asi se ve para muchos servidores
set(:domain) { "#{domain}" }
role(:web) { domain }
role(:app) { domain }
role(:db, :primary => true) { domain }

#Asi se vería un solo servidor
#role :web, "148.229.10.138"                          # Your HTTP server, Apache/etc
#role :app, "148.229.10.138"                          # This may be the same as your `Web` server
#role :db,  "labs.ti.uach.mx", :primary => true # This is where Rails migrations will run
#role :db,  "labs.ti.uach.mx"



# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
end