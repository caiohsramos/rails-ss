# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Folders' do
  describe 'GET index' do
    it 'renders index template' do
      get '/folders'
      expect(response).to render_template(:index)
    end
  end

  describe 'GET show' do
    let(:folder) { create(:folder) }

    it 'renders show template' do
      get "/folders/#{folder.id}"
      expect(response).to render_template(:show)
    end
  end

  describe 'DELETE destroy' do
    let(:folder) { create(:folder) }

    it 'renders index template' do
      delete "/folders/#{folder.id}"
      expect(response).to redirect_to(folders_url)
    end

    it 'deletes the folder' do
      delete "/folders/#{folder.id}"
      expect(Folder.count).to be_zero
    end
  end

  describe 'PUT update' do
    let(:folder) { create(:folder) }

    it 'renders index template' do
      put "/folders/#{folder.id}", params: { folder: { title: 'my title' } }
      expect(response).to redirect_to(folders_url)
    end

    it 'updates the folder' do
      put "/folders/#{folder.id}", params: { folder: { title: 'my title' } }
      expect(folder.reload.title).to eq('my title')
    end
  end

  describe 'GET new' do
    it 'renders new template' do
      get '/folders/new'
      expect(response).to render_template(:new)
    end
  end

  describe 'GET edit' do
    let(:folder) { create(:folder) }

    it 'renders edit template' do
      get "/folders/#{folder.id}/edit"
      expect(response).to render_template(:edit)
    end
  end

  describe 'POST create' do
    let(:params) { { folder: { title: 'title' } } }

    it 'redirects to folders_path' do
      post('/folders', params:)
      expect(response).to redirect_to(folder_url(assigns(:folder)))
    end

    it 'creates the folder' do
      expect { post('/folders', params:) }.to change(Folder, :count).by(1)
    end
  end
end
