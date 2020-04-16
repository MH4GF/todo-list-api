# frozen_string_literal: true

module V1
  class TodosController < ApplicationController
    def index
      render json: current_user.todos, each_serializer: TodoSerializer
    end

    def create
      todo = Todo.new(todo_params)
      todo.save!

      render json: todo, serializer: TodoSerializer, status: :created
    end

    def destroy
      todo = Todo.find(params[:id])
      todo.destroy!

      render head: :no_content
    end

    private

    def todo_params
      params.require(:todo).permit(:title, :user_id)
    end
  end
end
