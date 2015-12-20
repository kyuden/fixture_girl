require "fixture_girl/version"
require 'fixture_girl/delegations'
require 'fixture_girl/configuration'
require 'fixture_girl/namer'
require 'fixture_girl/builder'

module FixtureGirl
  class << self
    def configuration(opts = {})
      @configuration ||= FixtureGirl::Configuration.new(opts)
    end

    def configure(opts = {})
      yield configuration(opts)
    end
  end

  begin
    class Railtie < ::Rails::Railtie
      rake_tasks do
        load "tasks/fixture_girl.rake"
      end
    end
  rescue LoadError, NameError
  end
end
