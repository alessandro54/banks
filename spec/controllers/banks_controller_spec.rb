# frozen_string_literal: true

require 'rails_helper'


RSpec.describe BanksController, type: :controller do
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    context 'when bank exists' do
      let(:bank) { create(:bank) }

      it 'renders the show template' do

        get :show, params: { id: bank.id }

        expect(response).to render_template('show')
      end
    end

    context 'when bank does not exist' do
      it 'renders the 404 page' do
        get :show, params: { id: 0 }

        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new

      expect(response).to render_template('new')
    end
  end

  describe 'POST #create' do
    it 'creates a new bank' do
      post :create, params: { bank: { name: 'Test Bank' } }

      expect(response).to redirect_to(banks_path)
      expect(flash[:notice]).to eq(I18n.t('controllers.banks.create.success'))
    end
  end

  describe 'GET #edit' do
    let(:bank) { create(:bank) }

    it 'renders the edit template' do
      get :edit, params: { id: bank.id }

      expect(response).to render_template('edit')
    end
  end

  describe 'PUT #update' do
    let(:bank) { create(:bank) }

    it 'updates a bank' do
      put :update, params: { id: bank.id, bank: { name: 'Updated Bank' } }

      expect(response).to redirect_to(bank_path(bank))
      expect(flash[:notice]).to eq(I18n.t('controllers.banks.update.success'))
    end
  end

  describe 'DELETE #destroy' do
    let(:bank) { create(:bank) }

    it 'deletes a bank' do
      delete :destroy, params: { id: bank.id }

      expect(response).to redirect_to(banks_path)
      expect(flash[:notice]).to eq(I18n.t('controllers.banks.destroy.success'))
    end
  end
end
