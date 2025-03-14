class BlocksController < ApplicationController
  def index
    render json: Block.all, include: :props
  end

  def show
    block = Block.find_by(id: params[:id])
    if block
      render json: block_with_children(block), except: [ :component_id ]
    else
      render json: { error: "Block not found" }, status: :not_found
    end
  end

  def create
    block = Block.new(block_params)

    if block.save
      params[:props].map do |prop|
        block.props.create(
          name: prop[:name],
          value: prop[:value],
          default_prop_id: prop[:default_prop_id]
        )
      end
      render json: block, status: :created
    else
      render json: block.errors, status: :unprocessable_entity
    end
  end

  def destroy
    block = Block.find_by(id: params[:id])
    if block
      block.destroy
      render json: { success: "Block deleted" }
    else
      render json: { error: "Block not found" }, status: :not_found
    end
  end

  def update
    block = Block.find_by(id: params[:id])
    if block
      block.update(block_params)
      if block.valid?
        render json: block
      else
        render json: block.errors, status: :unprocessable_entity
      end
    else
      render json: { error: "Block not found" }, status: :not_found
    end
  end

  def move
    block = Block.find_by(id: params[:id])
    oldOrder = block.order
    if block
      if params[:direction] == "up"
        sibling = Block.where(parent_block_id: block.parent_block_id).where("\"order\" < ?", block.order).order(order: :desc).first
      elsif params[:direction] == "down"
        sibling = Block.where(parent_block_id: block.parent_block_id).where("\"order\" > ?", block.order).order(:order).first
      end
      block.update(order: sibling.order)
      sibling.update(order: oldOrder)
      render json: { success: "Block moved" }
    end
  end

  def block_params
    params.require(:block).permit(:name, :order, :component_id, :parent_block_id, :page_id, :props)
  end

  def block_with_children(block)
    children = Block.where(parent_block_id: block.id).order(:order)

    children_json = children.map { |child| block_with_children(child) }

    block_json = block.as_json(include: [ :props, { component: { include: :default_props } } ])
    block_json.merge!(children: children_json) if children.any?
    block_json
  end
end
