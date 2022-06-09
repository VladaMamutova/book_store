class BooksController < ApplicationController
  layout 'main'

  before_action :set_book, only: %i[show edit update destroy]

  # GET /books
  def index
    @books = Book.all
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit; end

  # POST /books
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to new_book_path, notice: "Книга \"#{@book.title}\" успешно добавлена."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      redirect_to edit_book_url(@book), notice: 'Информация о книге успешно обновлена'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def book_params
    params.require(:book).permit(:title)
  end
end
