# frozen_string_literal: true
require 'socket'
$hostname = Socket.gethostname
class ApplicationController < ActionController::API
  #liveness probe
  def ping
    render plain: "pong from #{$hostname}"
  end
end
