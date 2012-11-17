# configs

app_name = "decibel"


# deploy

require 'mina/bundler'
require 'mina/git'

set :domain,      'makevoid.com'
set :deploy_to,   "/www/#{app_name}"
set :repository,  "git://github.com/makevoid/#{app_name}"
set :branch,      'master'
set :password,    File.read(File.expand_path "~/.password").strip

# Manually create these paths in shared/ (eg: shared/config/database.yml) in your server.
# They will be linked in the 'deploy:link_shared_paths' step.
set :shared_paths, ['log']

set :user, 'www-data'

# This task is the environment that is loaded for most commands, such as
# `mina deploy` or `mina rake`.
task :environment do

end

# Put any custom mkdir's in here for when `mina setup` is ran.
# For Rails apps, we'll make some of the shared paths that are shared between
# all releases.
task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/shared/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/log"]
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'

    to :launch do
      queue 'mkdir -p tmp'
      queue 'touch tmp/restart.txt'
    end
  end
end

def exe(cmd)
  # puts "executing: #{cmd}"
  out = `#{cmd}`
  puts out
end

def mysql(cmd)
  "mysql -u root --password=#{password} #{cmd}"
end

desc "Creates the production db."
task :db_create do
  cmd = mysql "-e 'create database #{app_name}_production';"
  queue cmd
end

desc "Copies the development db to production."
task :db_toprod do
  exe "mysqldump -u root #{app_name}_development > db/#{app_name}_development.sql"
  exe "scp db/#{app_name}_development.sql #{user}@#{domain}:#{deploy_to}/current/db"
  cmd = mysql "#{app_name}_production < #{deploy_to}/current/db/#{app_name}_development.sql"
  queue cmd
end
