if defined?(ActiveModel)
  require 'rails/extensions/active_model'
else
  require 'rails/extensions/active_record'
end