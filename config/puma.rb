#!/usr/bin/env puma

#rails的运行环境
environment 'production'
#environment 'development'
threads 2, 64
workers 4

#项目名
app_name = "www.youzhi.com"
#项目路径
application_path = "/var/www/#{app_name}"
#这里一定要配置为项目路径下地current
directory "#{application_path}/current"

#下面都是 puma的配置项
pidfile "#{application_path}/tmp/pids/puma.pid"
state_path "#{application_path}/tmp/sockets/puma.state"
stdout_redirect "#{application_path}/log/puma.stdout.log", "#{application_path}/log/puma.stderr.log"
bind "unix://#{application_path}/tmp/sockets/#{app_name}.sock"
activate_control_app "unix://#{application_path}/tmp/sockets/pumactl.sock"

#后台运行
daemonize true
on_restart do
  puts 'On restart...'
end
preload_app!