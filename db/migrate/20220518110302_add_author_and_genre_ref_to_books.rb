class AddAuthorAndGenreRefToBooks < ActiveRecord::Migration[7.0]
  def change
    add_reference :books, :author, null: false, foreign_key: true
    add_reference :books, :genre, null: false, foreign_key: true
  end
end
