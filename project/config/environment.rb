# Load the Rails application.
require File.expand_path('../application', __FILE__)
require 'pdf/writer'
require 'pdf/writer/simple_table'
# Initialize the Rails application.
Rails.application.initialize!
Mime::Type.register 'application/pdf', :pdf