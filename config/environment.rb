# coding: utf-8
# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
Time::DATE_FORMATS[:ru_datetime] = "%d.%m.%Y в %k:%M:%S"
