class Page < ApplicationRecord
  has_many :blocks, -> { order(:order) }, dependent: :destroy
  validates :title, presence: true
  validates :slug, presence: true, format: { with: %r{\A[a-zA-Z0-9_-]+(?:/[a-zA-Z0-9_-]+)*\z}, message: "only allows letters, numbers, dashes, underscores, and slashes. No trailing slashes" }, uniqueness: true
end
