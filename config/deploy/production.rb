server '15.152.255.185', user: 'app', roles: %w{app db web}
set :ssh_options, keys: 'Users/shintaniyuta/.ssh/id_rsa'