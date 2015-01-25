require 'font-awesome-rails/engine'

module Template1
  class Engine < ::Rails::Engine
    engine_name 'template1'

    config.generators do |g|
      g.test_framework :rspec, fixture: false
    end
  end
end
