class BooksController < ApplicationController
  def index
  	 @books = Book.all
  	 @toukou = Book.new
  end

  def show
  	@toukou = Book.find(params[:id])
  end

  def new
  	@toukou = Book.new
  end

  def create

  	  @toukou = Book.new(toukou_params)

    if @toukou.save
     	redirect_to book_path(@toukou.id)
    else
    	@books = Book.all
     	render :index
	end

   end


  def destroy
  	  @toukou = Book.find(params[:id])
  	  @toukou.destroy
  	  redirect_to books_path
  end

  def edit
        @toukou = Book.find(params[:id])
  end

  def update
    @toukou = Book.find(params[:id])
    @toukou.update(toukou_params)
    redirect_to book_path(@toukou.id)
  end

  private

  def toukou_params
  	  params.require(:book).permit(:title, :body)
  end
end