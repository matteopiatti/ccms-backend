class Prop < ApplicationRecord
  belongs_to :component, optional: true
  belongs_to :block, optional: true
  validates :name, presence: true
  validates :title, presence: true
  validates :prop_type, presence: true
  validates :default, presence: true

  validate :must_have_component_or_block

  def must_have_component_or_block
    if component_id.nil? && block_id.nil?
      errors.add(:base, "must have a component or block")
    end
  end
end
