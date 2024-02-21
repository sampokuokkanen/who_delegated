# frozen_string_literal: true

# reopen Module from ActiveSupport to redefine delegate method
class Module
  alias __delegate delegate
  def delegate(*methods, to: nil, prefix: nil, allow_nil: nil, private: nil)
    if defined?(ActiveRecord::Base) && self < ActiveRecord::Base
      methods.each do |method|
        define_method("delegated_#{prefix}#{method}?") do
          true
        end
      end
    end
    __delegate(*methods, to:, prefix:, allow_nil:, private:)
  end
end
