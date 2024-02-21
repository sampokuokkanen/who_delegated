# frozen_string_literal: true

# reopen ActiveRecord::Base to add delegated_method? method
module WhoDelegated
  module ActiveRecordExtension
    def delegated_method?(method_name)
      respond_to?("delegated_#{method_name}?") && send("delegated_#{method_name}?")
    end

    def delegated_target(method_name)
      return unless delegated_method?(method_name)

      send("delegated_#{method_name}?")
    end
  end
end

ActiveRecord::Base.send(:include, WhoDelegated::ActiveRecordExtension)