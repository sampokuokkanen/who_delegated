# frozen_string_literal: true

module WhoDelegated
  module ActiveRecordExtensionClassMethods
    def delegated_method?(method_name)
      respond_to?("delegated_#{method_name}?") && send("delegated_#{method_name}?")
    end

    def delegated_target(method_name)
      return unless delegated_method?(method_name)

      send("delegated_#{method_name}?")
    end
  end
end

ActiveRecord::Base.extend WhoDelegated::ActiveRecordExtensionClassMethods
