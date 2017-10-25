# Load the Rails application.
require File.expand_path('../application', __FILE__)
require File.expand_path('../initializers/abstract_mysql_adapter', __FILE__)
require File.expand_path('../initializers/abstract_mysql2_adapter', __FILE__)

# Initialize the Rails application.
Hadhada::Application.initialize!
