# frozen_string_literal: true

# Para que podamos acceder a los métodos y factories de FactoryBot desde los tests
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
