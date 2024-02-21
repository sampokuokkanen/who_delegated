# frozen_string_literal: true

class Module
  alias __delegate delegate
  def delegate(*methods, to: nil, prefix: nil, allow_nil: nil, private: nil)
    if defined?(ActiveRecord::Base) && self < ActiveRecord::Base
      methods.each do |method|
        define_method("delegated_#{prefix}#{method}?") do
          to
        end
      end
    end
    __delegate(*methods, to:, prefix:, allow_nil:, private:)
  end
end
