if RUBY_VERSION < '2.0' || defined?(JRUBY_VERSION)
  require 'ruby-debug-base'
else
  require 'debase'
end

require 'ruby-debug-ide/version'
require 'ruby-debug-ide/ide_processor'

module Debugger

  class << self
    def print_greeting_msg(host, port)
      base_gem_name = if defined?(JRUBY_VERSION) || RUBY_VERSION < '1.9.0'
                        'ruby-debug-base'
                      elsif RUBY_VERSION < '2.0.0'
                        'ruby-debug-base19x'
                      else
                        'debase'
                      end

      file_filtering_support = if Command.file_filter_supported?
                                 'supported'
                               else
                                 'not supported'
                               end

      if host && port
        listens_on = " listens on #{host}:#{port}\n"
      else
        listens_on = "\n"
      end

      msg = "Fast Debugger (ruby-debug-ide #{IDE_VERSION}, #{base_gem_name} #{VERSION}, file filtering is #{file_filtering_support})" + listens_on

      $stderr.printf msg
    end
  end

end