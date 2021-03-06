class BooksController < ApplicationController

  def top

  end

  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id=current_user.id

    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice]="successfully"
    else
    @user=User.find(current_user.id)
    # @book = Book.new
    @books=Book.all
  
      render "books/index"
    end
  end

  def index
    @user=User.find(current_user.id)
    @books=Book.all
    @book=Book.new
  end

  def edit
    @book=Book.find(params[:id])
    if @book.user_id!=current_user.id
      redirect_to books_path
    end
  end

  def update
    # if @book.user_id=(current_user.id)
    @book=Book.find(params[:id])
    # else
    #   redirect_to book_path(@book.id)
    # end
    if @book.update(book_params)
    flash[:notice]="successfully"
    redirect_to "/books/#{@book.id}"
    else
    render "books/edit"
    end
  end

  def show
    @book=Book.find(params[:id])
    @user=User.find(@book.user.id)
    @book_new=Book.new
    # @books=Book.all
  end

  def destroy
    book=Book.find(params[:id])
    book.destroy
    flash[:notice]="successfully"
    redirect_to books_path
  end

  private

  def book_params
  params.require(:book).permit(:title, :body)
  end

end
