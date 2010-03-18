$:.unshift(File.dirname(__FILE__)) unless $:.include?(File.dirname(__FILE__))

require 'sc-core-ext/dependencies'
require 'sc-core-ext/hash'
require 'sc-core-ext/string'
require 'sc-core-ext/regexp'

module ScCoreExt
  VERSION = '1.0.0'
end
