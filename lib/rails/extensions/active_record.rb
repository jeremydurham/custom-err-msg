module ActiveRecord
  class Error

protected

    def generate_full_message(options = {})
      if self.message =~ /^\^/
        keys = ["{{message}}"]
        options.merge!(:default => self.message[1..-1])
      end

      I18n.translate(keys.shift, options)
    end
  end
end