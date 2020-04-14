# frozen_string_literal: true

module V1
  class TodosController < ApplicationController
    def create
      todo = Todo.new(todo_params)

      if todo.save
        render json: todo, serializer: TodoSerializer, status: :created
      else
        render json: { errors: todo.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def todo_params
      params.require(:todo).permit(:title, :user_id)
    end
  end
end
