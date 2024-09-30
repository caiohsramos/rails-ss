# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sessions' do
  describe 'GET /session/new' do
    it 'renders the new session form' do
      get '/session/new'
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:new)
    end
  end

  describe 'POST /session' do
    context 'with valid credentials' do
      it 'logs in the user and redirects to the root page' do
        post '/session', params: { username: 'admin', password: 'password' }
        expect(session[:authorized]).to be true
        expect(response).to redirect_to(root_url)
        expect(flash[:notice]).to eq('Logged in!')
      end
    end

    context 'with invalid credentials' do
      it 'renders the new session form with an error message' do
        post '/session', params: { username: 'invalid_username', password: 'invalid_password' }
        expect(session[:authorized]).to be_nil
        expect(response).to have_http_status(:unprocessable_content)
        expect(response).to render_template(:new)
        expect(flash[:alert]).to eq('Username or password is invalid')
      end
    end
  end
end
