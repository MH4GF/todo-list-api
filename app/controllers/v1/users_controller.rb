# frozen_string_literal: true

module V1
  class UsersController < ApplicationController
    def index
      users = User.all
      render json: users, each_serializer: UserSerializer
    end

    def show
      current_user = User.find(params[:id])
      render json: current_user, serializer: UserSerializer
    end

    def create
      user = User.create!(user_params)
      render json: user, serializer: UserSerializer, status: :created
    end

    private

    def user_params
      params.require(:user).permit(:email, :uid, :name)
    end
  end
end
