# frozen_string_literal: true

module Tracer
  def trace(op, &block)
    OpenTracing.start_active_span(op) do |scope|
      block.call
    end
  end
end
