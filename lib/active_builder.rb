# frozen_string_literal: true

require 'active_builder/version'

module ActiveBuilder
  class Error < StandardError; end

  module ClassMethod
    def attributes(attribute)
      attr_accessor attribute
      method_name = "with_#{attribute}".to_sym
      define_method(method_name) do |value|
        send("#{attribute}=", value)
        self
      end
    end
  end

  def self.included(klass)
    klass.extend ClassMethod
  end
end
