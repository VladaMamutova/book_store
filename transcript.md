# Book Store: практика

<hr>

## Templates

- Добавим шаблон для экшена index контроллера книг:

  `app/views/books/index.html.erb`
  ```erb
  <h1>Book Store</h1>
  <% if @books.blank? %>
    <p>В магазине нет книг :(</p>
  <% else %>
    <div id='books'>
      <% @books.each do |book| %>
        <p><%= book.title %></p>
      <% end %>
    </div>
  <% end %>

  <p><%= link_to 'Добавить книгу', { action: :new } %></p>
  ```

### Практика 1 - Доработка шаблона со списком книг
Переделать шаблон в соответствии с заданием:
  - Первая строка - название книги
  - Вторая строка - информация об авторе в формате `Автор: Фамилия И. О.`
  - Третья строка - информация о жанре в формате `Жанр: <название_жанра>`

<!--
<h1>Book Store</h1>

<% if @books.blank? %>
  <p>В магазине нет книг :(</p>
<% else %>
  <div id="books">
    <% @books.each do |book| %>
      <p><%= book.title %></p>
      <p>Автор: <%= book.author.last_name %> <%= book.author.first_name[0] %>.
        <%= book.author.middle_name.present? ? " #{book.author.middle_name[0]}." : '' %>
      </p>
      <p>Жанр: <%= book.genre %></p>
    <% end %>
  </div>
<% end %>

<p><%= link_to "Добавить книгу", { action: :new } %></p>
-->

## Layouts

### Практика 2 - Создание собственного макета для страниц книг

#### 2.1) с названием по умолчанию

- Создать файл макета `app/views/layouts/books.html.erb`.
- Скопировать в него разметку из файла макета по умолчанию - `app/views/layouts/application.html.erb`.
- Поменять `title` на `Book Store`.
- Посмотреть заголовок страницы со списком книг, обновить страницу и пронаблюдать за сменой заголовка. Посмотреть заголовок на странице добавления книги.

<!--
app/views/layouts/books.html.erb

<!DOCTYPE html>
<html>
  <head>
    <title>Book Store</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%= csrf_meta_tags %>
    <%= csp_meta_tag %>

    <%= stylesheet_link_tag "application" %>
  </head>

  <body>
    <%= yield %>
  </body>
</html>
-->

#### 2.2) с собственным названием
- Переименовать макет книг в `main.html.erb`. Страница книг снова имеет заголовок `App`.
- В контроллере книг после объявления класса контроллера добавить `layout 'main'`. Теперь на странице книг отрисован нужный макет с заголовком `Book Store`.

<!--
app/views/layouts/books.html.erb ->
app/views/layouts/main.html.erb

class BooksController < ApplicationController
  layout 'main'
  ...
end
-->

### Практика 3 - Создание именнованного компонента в макете

- в макете страниц книг заменить тег `<title>` именованным `yield`:

  `app/views/layouts/books.html.erb`
  ```
  ...
    <head>
      <%= yield :title %>
      ...
    </head>
  ...
  ```

- в шаблоне списка книг с помощью `content_for`  указать разметку для `:title`:

  `app/views/books/index.html.erb`
  ```
  <% content_for :title do %>
    <title>Book Store: Книги</title>
  <% end %>
  ...
  ```
- Обновить страницу списка книг и убедиться, что заголовок соответствует заголовку из тега `title`. Посмотреть заголовок на странице добавления книги.
- Обновить заголовок на странице добавления книги (например, "Добавление книги").

## Partials

### Практика 4 - Создание частичного шаблона

- Cоздать макет для отображения информации о книге:
  
  `app/views/books/_book_layout.erb`
  ```erb
  <div id="<%= dom_id book %>">
    <%= yield %>
  </div>
  ```
- Переместить информацию о книге из шаблона `app/views/books/index.html.erb` в частичный шаблон `app/views/books/_book.erb`
- Вызвать рендеринг частичного шаблона в `app/views/books/index.html.erb` разными способами и, перезагружая страницу, проанализировать полученные результаты:
  
  `app/views/books/index.html.erb`
  ```erb
  ...
  <% @books.each do |book| %>
    <%= render book %>
    <%#= render 'book', book: book %>
    <%#= render partial: 'book', locals: { book: book } %>
    <%#= render partial: 'books/book', locals: { book: book } %>
    <%#= render partial: 'book', layout: 'book_layout', locals: { book: book } %>
  <% end %>
  ...
  ```

### Практика 5 - Упрощение шаблона

- Упростить вывод ФИО автора и привести разметку частичного шаблона к следующему виду:

  ```erb
  <p><%= book.title %></p>
  <p>Автор: <%= book.author %></p>
  <p>Жанр: <%= book.genre %></p>
  ```

  *Подсказка: переопределить метод `to_s` в классе модели `Author` и `Genre`*

- Модифицировать написанный метод таким образом, чтобы он принимал необязательный параметр `full` булевого типа (значение по умолчанию - `false`) и при `full: true` выводил имя, отчество и фамилию полностью (формат: `Имя Отчество Фамилия`). 

<!--
app/models/author.rb

class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  def to_s(full: false)
    full ? full_name : "#{last_name} #{initials}"
  end

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def initials
    "#{first_name[0]}." + (middle_name.present? ? " #{middle_name[0]}." : '')
  end
end

app/models/genre.rb
class Genre < ApplicationRecord
  def to_s
    name
  end
end

```
-->

## Helpers

### Практика 6 - Подключение стилей с помощью `stylesheet_link_tag`

- Добавим класс `book-item` в макет книги:

`app/views/books/_book_layout.html.erb`
```erb
<div id="<%= dom_id book %>" class="book-item">
  <%= yield %>
</div>
```

- TODO:

  `app/views/books/_book.html.erb`

  ```erb
  <div class="book-cover">
    <%= image_tag "book.svg", alt: "Обложка книги" %>
  </div>

  <div class="book-info">
    <p class="book-title"><%= book.title %></p>
    <p>Автор: <span><%= book.author.to_s(full: true) %></span></p>
    <p>Жанр: <span><%= book.genre %></span></p>
  </div>
  ```

- TODO:

  `app/views/layouts/main.html.erb`
  ```html
  <!DOCTYPE html>
  <html>
    <head>
    ...
    <%= stylesheet_link_tag "books" %>
    </head>

    <body>
      <%= yield %>
    </body>
  </html>
  ```

<!--


-->


<!--

-->