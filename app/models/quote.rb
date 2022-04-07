class Quote < ApplicationRecord
  validates :name, uniqueness: true, presence: true

  scope :ordered, -> { order(id: :desc) }
end
