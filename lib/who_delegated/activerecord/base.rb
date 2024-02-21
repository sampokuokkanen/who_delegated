# frozen_string_literal: true

# reopen ActiveRecord::Base to add delegated_method? method
module ActiveRecord
  class Base # rubocop:todo Style/Documentation
    def delegated_method?(method_name)
      respond_to?("delegated_#{method_name}?") && send("delegated_#{method_name}?")
    end
  end
end
