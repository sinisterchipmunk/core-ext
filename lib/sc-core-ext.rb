$:.unshift(File.dirname(__FILE__)) unless $:.include?(File.dirname(__FILE__))

require 'sc-core-ext/dependencies'
require 'sc-core-ext/object'
require 'sc-core-ext/hash'
require 'sc-core-ext/string'
require 'sc-core-ext/regexp'
require 'sc-core-ext/array'
require 'sc-core-ext/date_time'
require 'sc-core-ext/active_support/ordered_hash'
require 'sc-core-ext/float'

module ScCoreExt
  VERSION = '1.1.0'
end
