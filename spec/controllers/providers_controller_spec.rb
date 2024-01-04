# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProvidersController, type: :controller do
  describe 'GET #index' do
    it 'renders the index template' do
      get :index

      expect(response).to render_template('index')
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new

      expect(response).to render_template('new')
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      let(:bank) { create(:bank) }
      let(:valid_attributes) do
        {
          name: 'Provider Name',
          nit: '123456789-3',
          contact_name: 'Alessandro Chumpitaz',
          contact_phone: '987654321',
          account_number: '123456789',
          bank_id: bank.id
        }
      end

      it 'creates a new provider' do
        expect do
          post :create, params: { provider: valid_attributes }
        end.to change(Provider, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) do
        {
          name: '',
          nit: '',
          contact_name: '',
          contact_phone: '',
          account_number: '',
          bank_id: ''
        }
      end

      it 'does not create a new provider' do
        expect do
          post :create, params: { provider: invalid_attributes }
        end.to change(Provider, :count).by(0)

        expect(response).to render_template('new')
      end
    end
  end
end
