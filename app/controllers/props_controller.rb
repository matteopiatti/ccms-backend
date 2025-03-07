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

  def prop_params
    params.require(:prop).permit(:name, :title, :prop_type, :default, :description)
  end
end
