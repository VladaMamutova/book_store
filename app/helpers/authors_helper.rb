module AuthorsHelper
  def author_options(selected = nil)
    authors = Author.all.map { |author| [author.full_name, author.id] }
    options_for_select(authors, selected)
  end
end
