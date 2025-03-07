class Component < ApplicationRecord
  has_many :props, dependent: :destroy
  has_many :blocks, dependent: :destroy
  validates :filename, presence: true, format: { with: %r{\A[a-zA-Z0-9_-].+(?:/.[a-zA-Z0-9_-]+)*\z}, message: "only allows letters, numbers, dashes, underscores, and slashes. No trailing slashes" }, uniqueness: true
  validates :name, presence: true
end
