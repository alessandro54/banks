require 'rails_helper'

RSpec.describe Provider, type: :model do
  describe 'associations' do
    it { should belong_to(:bank) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:nit) }
    it { should validate_presence_of(:contact_name) }
    it { should validate_presence_of(:contact_phone) }

    it { should validate_length_of(:contact_phone).is_at_most(10) }
    it { should validate_length_of(:account_number).is_at_most(15) }

    it { should allow_value('901362343-4').for(:nit)}
    it { should allow_value('123456789').for(:nit)}

    it { should_not allow_value('1234567890').for(:nit)}
    it { should_not allow_value('12345').for(:nit)}
  end
end
