module ActiveRecord
  class Base
    def delegated_method?(method_name)
      respond_to?("delegated_#{method_name}?") && send("delegated_#{method_name}?")
    end
  end
end
