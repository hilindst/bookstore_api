class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :update, :destroy]

  def create
    author = Author.new(author_params)
    if author.save
      render json: author, status: :created
    else
      render json: author.errors, status: :unprocessable_entity
    end
  end

  def index 
    render json: Author.all
  end

  def show 
    render json: @author, status: :ok 
  end

  def update 
    if @author.update(author_params)
      render json: @author, status: :ok 
    else 
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @author.destroy
      # return a response with only headers and no body
      head :no_content
    else 
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  private

  def author_params
    params.require(:author).permit(:author_name)
  end

  def set_author
    @author = Author.find(params[:id])
  end
end