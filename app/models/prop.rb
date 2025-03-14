class Prop < ApplicationRecord
  belongs_to :block
  belongs_to :default_prop
  validates :name, presence: true
end
