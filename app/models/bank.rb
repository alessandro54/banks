class Bank < ApplicationRecord
  validates_length_of :name, maximum: 50
end
