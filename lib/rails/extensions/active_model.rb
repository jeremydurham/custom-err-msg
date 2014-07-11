module ActiveModel
  class Errors
    def full_message(attribute, message)
      return message if attribute == :base
      attr_name = attribute.to_s.tr('.', '_').humanize
      attr_name = @base.class.human_attribute_name(attribute, default: attr_name)

      puts "mmmm: #{message}"
      if message.start_with?('^')
        I18n.t(:"errors.format", {
          default:  "%{message}",
          attribute: '',
          message:   message[1..-1]
        })
      else
        I18n.t(:"errors.format", {
          default:  "%{attribute} %{message}",
          attribute: attr_name,
          message:   message
        })
      end
    end
  end
end