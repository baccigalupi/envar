module Envar
  class << self
    def method_missing(name, *args, &block)
      from_env(name)
    end

    def from_env(name)
      name = name.to_s
      Envar::Config.load
      ENV[name] || ENV[name.upcase]
    end
  end
end
