class AnimalsController < ApplicationController
  def index
    @animals = Animal.all.order(:age)
  end

  def show
    @animal = Animal.find_by(id: params[:id])

    if @animal.nil?
      render :notfound, status: :not_found
    end
  end

  def new
    @animal = Animal.new
  end

  def create
    animal = Animal.new(animal_params)

    if animal.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def update
    animal = Animal.find(params[:id])
    animal.update(animal_params)

    if animal.save
      redirect_to animal_path
    else
      render :edit
    end
  end

  def destroy
    animal = Animal.find_by(id: params[:id])

    if animal.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private
  def animal_params
    return params.require(:animal).permit(:name, :species, :age)
  end
end
