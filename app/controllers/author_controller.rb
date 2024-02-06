class AuthorController < ApplicationController
  def index
    @authors = Author.all
  end
  
  def show
    @author = Author.find(params[:id])
  end
  
  def create
    @author = Author.new(params[:author])
    if @author.save
        redirect_to action:: 'show', id: @author.id
    else
    end
  end
   
  def update
    @author = Author.find(params[:id])
   
    if @author.update_attributes(author_param)
       redirect_to :action => 'show', :id => @author
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

  validates :first_name, presence: true
  validates :last_name, presence: true
end
