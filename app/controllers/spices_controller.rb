class SpicesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

def index
    render json: Spice.all
end
def create
    spice = Spice.create(spice_params)
    render json: spice, status: :created
end
def update
    spice = find_spice
    spice.update(spice_params)
    render json: spice
end
def destroy
    spice = find_spice
    spice.destroy
    render head: :no_content
end

private

def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
end
def find_spice
    spice = Spice.find(params[:id])
end

def record_not_found
  render json: { error: 'Not found' }, status: 404
end
end
