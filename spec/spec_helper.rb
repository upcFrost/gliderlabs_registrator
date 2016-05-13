require 'chefspec'
require 'chefspec/berkshelf'

ChefSpec::Coverage.start! { add_filter 'gliderlabs_registrator' }

RSpec.configure do |config|
  # Make the output look nice
  config.color = true
  config.tty = true
  config.formatter = :documentation
  # Log level
  config.log_level = :fatal
  # Test platform
  config.platform = 'centos'
  config.version = '7.0'
end
