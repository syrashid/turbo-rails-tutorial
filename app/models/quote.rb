class Quote < ApplicationRecord
  belongs_to :company

  validates :name, uniqueness: true, presence: true

  scope :ordered, -> { order(id: :desc) }

  has_many :line_item_dates, dependent: :destroy
  has_many :line_items, through: :line_item_dates

  # AfterCreateCommit has to do with running only after a successful db transaction after create
  # after_create_commit -> { broadcast_prepend_later_to "quotes" }
  # after_update_commit -> { broadcast_replace_later_to "quotes" }
  # after_destroy_commit -> { broadcast_remove_to "quotes" }
  # Those three callbacks are equivalent to the following single line
  broadcasts_to ->(quote) { [quote.company, "quotes"] }, inserts_by: :prepend

  def total_price
    line_items.sum(&:total_price)
  end
end
