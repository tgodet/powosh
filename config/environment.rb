# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# Initialize default meta tags.
DEFAULT_META = YAML.load_file(Rails.root.join('config/meta.yml'))
