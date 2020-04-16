# frozen_string_literal: true

class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  rescue_from ActiveRecord::RecordNotFound, with: :error404
  rescue_from ActiveRecord::RecordInvalid, with: :error422

  def error404(err)
    render json: { error: err }, status: :not_found
  end

  def error422(err)
    render json: { errors: err.record.errors.full_messages }, status: :unprocessable_entity
  end
end
