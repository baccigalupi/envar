require 'active_support/core_ext/module/delegation'
require 'dotenv'

require "envar/version"
require 'envar/config'
require 'envar/accessor'
require 'envar/railtie' if defined?(Rails)
