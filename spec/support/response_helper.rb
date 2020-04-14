# frozen_string_literal: true

module ResponseHelper
  shared_context 'JSON response' do
    let(:json_response) { JSON.parse(response.body, symbolize_names: true) }
  end
end
