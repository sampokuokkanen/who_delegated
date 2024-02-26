# frozen_string_literal: true

# reopen Module from ActiveSupport
class Module
  alias __delegate delegate
  def delegate(*methods, to: nil, prefix: nil, allow_nil: nil, private: nil)
    if defined?(ActiveRecord::Base) && self < ActiveRecord::Base
      methods.each do |method|
        method_name = "delegated_#{"#{prefix == true ? to : prefix}_" if prefix}#{method}?"
        define_singleton_method(method_name) do
          respond_to?(method)
        end
        define_method(method_name) do
          to
        end
      end
    end
    __delegate(*methods, to:, prefix:, allow_nil:, private:)
  end
end
