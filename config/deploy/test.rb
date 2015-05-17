set :stage, :production
set :server_name, "test.chuanqioo.com"

set :branch, "master"

set :log_level, :debug

set :deploy_to, "/data/www/legend_source"

set :build_folder, "/data/www/legend_source/build"
set :site_folder, "/data/www/legend"
#set :password, ask('Server password', nil)
##server fetch(:server_name), user: 'soar', port: 22, password: fetch(:password), roles: %w{web app db}
#
server fetch(:server_name), user: "soar", roles: %w{web app db}
