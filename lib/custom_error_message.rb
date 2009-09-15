module ActiveRecord
  class Errors

    # Redefine the ActiveRecord::Errors::full_messages method:
    #  Returns all the full error messages in an array. 'Base' messages are handled as usual.
    #  Non-base messages are prefixed with the attribute name as usual UNLESS 
    # (1) they begin with '^' in which case the attribute name is omitted.
    #     E.g. validates_acceptance_of :accepted_terms, :message => '^Please accept the terms of service'
    # (2) the message is a proc, in which case the proc is invoked on the model object.
    #     E.g. validates_presence_of :assessment_answer_option_id, 
    #     :message => Proc.new { |aa| "#{aa.label} (#{aa.group_label}) is required" }
    #     which gives an error message like:
    #     Rate (Accuracy) is required
    def full_messages
      full_messages = []

      @errors.each_key do |attr|
        @errors[attr].each do |msg|
          next if msg.nil?
          msg = msg.respond_to?(:message) ? msg.message : msg
          if attr == "base"
            full_messages << msg
          elsif msg =~ /^\^/
            full_messages << msg[1..-1]
          elsif msg.is_a? Proc
            full_messages << msg.call(@base)
          else
            full_messages << @base.class.human_attribute_name(attr) + " " + msg
          end
        end
      end

      return full_messages
    end
  end
end
