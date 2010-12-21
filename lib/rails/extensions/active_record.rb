module ActiveRecord
  class Error

protected

    def generate_full_message(options = {})
      keys = [
        :"full_messages.#{@message}",
        :'full_messages.format'
      ]
      
      if self.message =~ /^\^/
        keys.push('{{message}}')

        options.merge!(:default => self.message[1..-1])
      else
        keys.push('%{attribute} %{message}')

        options.merge!(:default => keys, :message => self.message)        
      end
      
      I18n.translate(keys.shift, options)
    end
  end
end