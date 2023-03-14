class PlantsController < ApplicationController
    #GET Plants
    def index
        plants = Plant.all
        render json: plants
    end

    #CREATE Plants
    def create
        plant = Plant.create(plant_params)
        render json: plant, status: :created
    end


    #GET Plants by id
    def show
        plant = Plant.find_by(id: params[:id])
        if plant
            render json: plant
        else
            render json: {error: "Plant not found"},status: :not_found
        end
    end

    #private method
    private
    def plant_params
        params.permit(:name, :image, :price)
    end


end
