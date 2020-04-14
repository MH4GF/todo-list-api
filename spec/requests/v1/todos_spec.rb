# frozen_string_literal: true

require './spec/rails_helper'

RSpec.describe 'Todos', type: :request do
  include_context 'JSON response'

  describe 'GET /v1/todos' do
    let(:user) { create(:user) }

    before do
      post v1_todos_url, params: params
    end

    context '正しいparamsの場合' do
      let(:params) do
        {
          "todo": {
            "title": 'hoge',
            "user_id": user.id.to_s,
          },
        }
      end

      it 'createdステータスを返す' do
        expect(response).to have_http_status :created
      end

      it 'titleがparamsの値と一致する' do
        expect(Todo.find_by(user_id: params[:todo][:user_id].to_i).title).to eq params[:todo][:title]
      end
    end

    context 'paramsが不正な場合' do
      context '存在しないuser_idの場合' do
        let(:params) do
          {
            "todo": {
              "title": 'hoge',
              "user_id": (user.id + 1).to_s,
            },
          }
        end

        it 'unprocessable_entityステータスを返す' do
          expect(response).to have_http_status :unprocessable_entity
        end

        it 'userが存在しない旨のエラーメッセージが返る' do
          expect(json_response[:errors]).to include('User must exist')
        end
      end

      context 'titleが存在しない場合' do
        let(:params) do
          {
            "todo": {
              "user_id": user.id.to_s,
            },
          }
        end

        it 'unprocessable_entityステータスを返す' do
          expect(response).to have_http_status :unprocessable_entity
        end

        it 'userが存在しない旨のエラーメッセージが返る' do
          expect(json_response[:errors]).to include("Title can't be blank")
        end
      end
    end
  end
end
