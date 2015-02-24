current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                'hbotee'
client_key               "#{current_dir}/hbotee.pem"
validation_client_name   'sequoiacapital-validator'
validation_key           "#{current_dir}/sequoiacapital-validator.pem"
chef_server_url          'https://chef-direct.sequoiacap.com:443'
syntax_check_cache_path  "#{current_dir}/syntax_check_cache"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
ssl_verify_mode          :verify_none

#chef_server_url  'http://127.0.0.1:8889'
