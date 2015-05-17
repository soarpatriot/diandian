# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'legend'
set :repo_url, 'git@github.com:soarpatriot/legend.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do
  
  desc 'operation'
  task :operation do 
    invoke :"deploy:build"
    invoke :"deploy:copy"
  end
   
  desc 'build production'
  task :build do 
    on roles :app do 
      within current_path do 
        execute :bundle, "exec middleman build"
      end
    end
  end
  
  desc 'copy build'
  task :copy do 
    on roles :app do 
      within current_path do 
        execute :rm, "-rf #{fetch(:site_folder)}"
        execute :cp, "-r #{current_path}/build #{fetch(:site_folder)}"
      end 
    end
  end

  after :publishing, :operation 

end

# after "deploy:publishing", "deploy:operation"
