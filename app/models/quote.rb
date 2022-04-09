class Quote < ApplicationRecord
  validates :name, uniqueness: true, presence: true

  scope :ordered, -> { order(id: :desc) }

  # AfterCreateCommit has to do with running only after a successful db transaction after create
  after_create_commit -> { broadcast_prepend_to "quotes", partial: "quotes/quote", locals: { quote: self }, target: "quotes" }
end
