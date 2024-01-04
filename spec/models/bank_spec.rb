# frozen_string_literal: true

require 'rails_helper'


RSpec.describe Bank, type: :model do
  describe 'validations' do
    it { should validate_length_of(:name).is_at_most(50) }
  end
end
