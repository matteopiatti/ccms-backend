class ComponentsController < ApplicationController
  def index
    render json: Component.all, include: :props
  end

  def show
    component = Component.find_by(id: params[:id])
    if component
      render json: component, include: :props
    else
      render json: { error: "Component not found" }, status: :not_found
    end
  end

  def create
    component = Component.new(component_params)

    if component.save
      params[:schema].map do |prop|
        component.props.create(
          name: prop[:name],
          title: prop[:title],
          prop_type: prop[:prop_type],
          default: prop[:default],
          description: prop[:description]
        )
      end

      render json: component, status: :created
    else
      render json: component.errors, status: :unprocessable_entity
    end
  end

  def destroy
    component = Component.find_by(id: params[:id])
    if component
      component.destroy
      render json: { success: "Component deleted" }
    else
      render json: { error: "Component not found" }, status: :not_found
    end
  end

  def update
    component = Component.find_by(id: params[:id])
    if component
      component.update(component_params)
      if component.valid?
        render json: component
      else
        render json: component.errors, status: :unprocessable_entity
      end
    else
      render json: { error: "Component not found" }, status: :not_found
    end
  end

  def component_params
    params.require(:component).permit(:filename, :name, :schema)
  end
end
