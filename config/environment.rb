# Load the rails application
require File.expand_path('../application', __FILE__)

# adapter for mysql2
require File.expand_path('../initializers/mysql2_adapter', __FILE__)

# Initialize the rails application
Suporte2::Application.initialize!

