class PropsController < ApplicationController
  def index
    render json: Prop.all
  end

  def create
    prop = Prop.create(prop_params)
    if prop.valid?
      render json: prop, status: :created
    else
      render json: prop.errors, status: :unprocessable_entity
    end
  end

  def destroy
    prop = Prop.find_by(id: params[:id])
    if prop
      prop.destroy
      render json: { success: "Prop deleted" }
    else
      render json: { error: "Prop not found" }, status: :not_found
    end
  end

  def update
    prop = Prop.find_by(id: params[:id])
    if prop
      prop.update(prop_params)
      if prop.valid?
        render json: prop
      else
        render json: prop.errors, status: :unprocessable_entity
      end
    else
      render json: { error: "Prop not found" }, status: :not_found
    end
  end

  def prop_params
    params.require(:prop).permit(:name, :value, :default_prop_id, :block_id)
  end
end
