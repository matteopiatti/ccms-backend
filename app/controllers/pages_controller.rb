class PagesController < ApplicationController
  def index
    render json: Page.all
  end

  def show
    page = Page.find_by(slug: params[:slug])
    if page
      top_level_blocks = page.blocks.where(parent_block_id: nil)
      blocks_json = top_level_blocks.map { |block| BlocksController.new.block_with_children(block) }

      render json: page.as_json.merge(blocks: blocks_json)
    else
      render json: { error: "Page not found" }, status: :not_found
    end
  end

  def create
    page = Page.create(page_params)
    if page.valid?
      render json: page, status: :created
    else
      render json: page.errors, status: :unprocessable_entity
    end
  end

  def delete
    page = Page.find_by(id: params[:id])
    if page
      page.destroy
      render json: { success: "Page deleted" }
    else
      render json: { error: "Page not found" }, status: :not_found
    end
  end

  def update
    page = Page.find_by(id: params[:id])
    if page
      page.update(page_params)
      if page.valid?
        render json: page
      else
        render json: page.errors, status: :unprocessable_entity
      end
    else
      render json: { error: "Page not found" }, status: :not_found
    end
  end

  def page_params
    params.require(:page).permit(:title, :slug)
  end
end
