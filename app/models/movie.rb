class Movie < ApplicationRecord
  validates :title, :year, presence: true
  validates :title, uniqueness: { scope: :year }
  scope :unread, -> { where(read: false) }
  scope :read, -> { where(read: true) }
end