# frozen_string_literal: true

class ApplicationController < ActionController::API
  def render_success(body)
    render status: 200, json: body
  end

  def render_error(body)
    render status: :error, json: body
  end
end
