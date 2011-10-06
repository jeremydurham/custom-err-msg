module ActiveModel
  class Errors
    def full_messages
      full_messages = []

      each do |attribute, messages|
        messages = Array.wrap(messages)
        next if messages.empty?

        if attribute == :base
          messages.each {|m| full_messages << m }
        else          
          attr_name = attribute.to_s.gsub('.', '_').humanize
          attr_name = @base.class.human_attribute_name(attribute, :default => attr_name)
          options = { :default => "%{attribute} %{message}", :attribute => attr_name }

          
          messages.each do |m|
            if m =~ /^\^/
              full_messages << I18n.t(:"errors.format.full_message", options.merge(:message => m[1..-1], :default => "%{message}"))
            else        
              full_messages << I18n.t(:"errors.format", options.merge(:message => m))
            end
          end
        end
      end

      full_messages
    end
  end
end