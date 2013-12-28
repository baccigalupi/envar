module Envar
  class Railtie < Rails::Railtie
    initializer "envar.configure_rails_initialization" do
      Envar::Config.environment = Rails.environment
    end
  end
end

