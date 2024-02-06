class AuthorsController < ApplicationController
  def index
    @authors = Author.all
    render json: @authors
  end

  def new
    @author = Author.new
  end
  
  def show
    @author = Author.find(params[:id])
  end
  
  def create
   
    author_params = params.require(:author).permit(:first_name, :last_name, )

    @author = Author.new(author_params)
  
   if @author.save
      redirect_to action: 'show', id: @author.id
    else
     render json: { error: "Unable to create author." }
    end
  end
   
  def update
    @author = Author.find(params[:id])
   
    if @author.update_attributes(author_param)
      redirect_to action: 'show', id: @author.id
    else
    end
    
 end
 
 def author_param
    params.require(:author).permit(:first_name, :last_name)
 end
  
  def destroy
    Author.find(params[:id]).destroy
     redirect_to :action => 'index'
  end

 
end
