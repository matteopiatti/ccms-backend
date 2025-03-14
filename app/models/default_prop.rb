class DefaultProp < ApplicationRecord
  belongs_to :component
  validates :name, presence: true
  validates :title, presence: true
  validates :prop_type, presence: true
  validates :default, presence: true
end
