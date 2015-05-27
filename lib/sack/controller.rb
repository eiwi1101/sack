module Sack::Controller

  def self.included base
    base.extend ClassMethods
  end

  module ClassMethods

    # operation_module or operation_method may be overriden
    # to switch operations based on some logic
    def operation(klass, method)
      define_method(:operation_module) { klass }
      define_method(:operation_method) { method }
    end

  end

  # Optionally override to compute args
  # for the operation
  def prepare
    []
  end

  def invoke_operation
    operation_module.send(operation_method, *prepare)
  end

  # Override for full control over how the operation is
  # invoked and its outcome is handled
  def perform
    result = invoke_operation
    send(result.success? ? :success : :failure, result.value)
  end

end
