# frozen_string_literal: true

RSpec.shared_context 'with authorization request' do
  before { post '/session', params: { username: 'admin', password: 'password' } }
end
