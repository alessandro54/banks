class Bank < ApplicationRecord
  validates_length_of :name, maximum: 50

  has_many :providers, dependent: :destroy
end
