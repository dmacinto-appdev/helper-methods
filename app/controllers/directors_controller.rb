class DirectorsController < ApplicationController
  def new
    @director = Director.new
  end

  def index
    @directors = Director.order(created_at: :desc )

    respond_to do |format|
      format.json do
        render json: @directors
      end

      format.html
    end
  end

  def show
    @director = Director.find(params.fetch(:id))
  end

  def create
    director_attributes = params.require(:director).permit(:name, :dob)

    @director = Director.new(director_attributes)

    if @director.valid?
      @director.save
      redirect_to directors_url, notice: "Director created successfully."
    else
      render template: "new"
    end
  end

  def edit
    @director = Director.find(params.fetch(:id)) 
  end

  def update
    director_attributes = params.require(:director).permit(:name, :dob, :id)

    @director = Director.find(params.fetch(:id))

    if @director.valid?
      @director.update(director_attributes)
      redirect_to director_url(@director), notice: "Director updated successfully."
    else
      redirect_to director_url(@director), alert: "Director failed to update successfully."
    end
  
  end

  def destroy
    @director = Director.find(params.fetch(:id)) 

    @director.destroy

    redirect_to directors_url, notice: "Movie deleted successfully."
  end
end
