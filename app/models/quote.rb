class Quote < ApplicationRecord
  validates :name, uniqueness: true, presence: true
end
