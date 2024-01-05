class Provider < ApplicationRecord
  validates :name, :nit, :contact_name, :contact_phone, presence: true
  validates :contact_phone, length: { maximum: 10 }
  validates :account_number, length: { maximum: 15 }
  validates :nit, format: { with: /\A\d{9}(-\d)?\z/ }

  belongs_to :bank
end
