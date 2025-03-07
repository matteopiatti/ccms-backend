class Block < ApplicationRecord
  before_create :set_order

  private

  def set_order
    max_order = Block.where(parent_block_id: parent_block_id).maximum(:order) || -1
    self.order = max_order + 1
  end

  belongs_to :component
  belongs_to :page
  belongs_to :parent_block, class_name: "Block", optional: true
  has_many :child_blocks, class_name: "Block", foreign_key: "parent_block_id", dependent: :destroy
  has_many :props, dependent: :destroy

  validates :name, presence: true
  validates :order, presence: true
end
