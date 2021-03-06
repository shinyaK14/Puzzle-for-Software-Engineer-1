# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'factory_girl'
require 'shoulda/matchers'

FactoryGirl.find_definitions

# Add additional requires below this line. Rails is not loaded until this point!

::Rails.application.routes.default_url_options[:host] = 'localhost:3000'

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
# ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|

  config.before :each do
    DatabaseCleaner[:mongoid].start
    DatabaseCleaner.start
  end

  config.after :each do
    DatabaseCleaner[:mongoid].clean
    DatabaseCleaner.clean
  end

  config.infer_spec_type_from_file_location!

  config.include ApiHelper
  config.include FactoryGirl::Syntax::Methods
  config.include ActionDispatch::TestProcess
  config.include ApiHelper, type: :api
  FactoryGirl::SyntaxRunner.class_eval do
    include ActionDispatch::TestProcess
  end
end
