module Envar
  class Config
    class << self
      delegate :load_environments, :load_environments=,
        :environment, :environment=,
        :load?, :load, :loaded?,
          to: :config

      def config
        @config ||= Envar::Config.new
      end

      def reset
        @config = nil
        config
      end
    end

    attr_accessor :environment
    attr_writer :load_environments

    def load_environments
      @load_environments ||= ['development', 'test']
    end

    def load?
      load_environments.include?(environment)
    end

    def loaded?
      @loaded
    end

    def load
      if load? && !loaded?
        Dotenv.load
        @loaded = true
      end
    end
  end
end
