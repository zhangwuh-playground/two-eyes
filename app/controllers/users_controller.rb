# frozen_string_literal: true
require 'securerandom'

class UsersController < ActionController::API
  include BushService
  include Tracer
  def get
    id = params[:id]
    trace("UserController:get") {
      render json: getUser(id)
    }
  end

  def send_message
    id = params[:id]
    SendMessageWorker.perform_async(id, params[:message])
    render status: 200
  end
end
