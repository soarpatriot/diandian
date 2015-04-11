set :stage, :production
set :server_name, "192.168.1.101"

set :branch, "master"

set :log_level, :debug

set :deploy_to, "/home/soar/site/legend_site"

set :build_folder, "/home/soar/site/legend_site/build"
set :site_folder, "/home/soar/site/legend"
#set :password, ask('Server password', nil)
##server fetch(:server_name), user: 'soar', port: 22, password: fetch(:password), roles: %w{web app db}
#
server fetch(:server_name), user: "soar", roles: %w{web app db}
