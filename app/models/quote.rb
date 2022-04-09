class Quote < ApplicationRecord
  validates :name, uniqueness: true, presence: true

  scope :ordered, -> { order(id: :desc) }

  # AfterCreateCommit has to do with running only after a successful db transaction after create
  after_create_commit -> { broadcast_prepend_later_to "quotes" }
  after_update_commit -> { broadcast_replace_later_to "quotes" }
  after_destroy_commit -> { broadcast_remove_to "quotes" }
end
