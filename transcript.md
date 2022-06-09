# Book Store: практика

<hr>

## Templates (шаблоны)

### Практика 1: Создание шаблона со списком книг

- Добавить шаблон для экшена index контроллера книг:

  `app/views/books/index.html.erb`
  ```erb
  <% if @books.blank? %>
    <p>В магазине нет книг :(</p>
  <% else %>
    <div id='books'>
      <% @books.each do |book| %>
        <p><%= book.title %></p>
        <br>
      <% end %>
    </div>
  <% end %>

  <b><%= link_to 'Добавить книгу', { action: :new } %></b>
  ```

- Переделать шаблон в соответствии с заданием:
  - Первая строка - название книги
  - Вторая строка - информация об авторе в формате `Автор: Фамилия И. О.`
  - Третья строка - информация о жанре в формате `Жанр: <название_жанра>`

<!--
<% if @books.blank? %>
  <p>В магазине нет книг :(</p>
<% else %>
  <div id="books">
    <% @books.each do |book| %>
      <p><%= book.title %></p>
      <p>Автор: <%= book.author.last_name %> <%= book.author.first_name[0] %>.
        <%= book.author.middle_name.present? ? " #{book.author.middle_name[0]}." : '' %>
      </p>
      <p>Жанр: <%= book.genre.name %></p>
    <% end %>
  </div>
<% end %>

<p><%= link_to "Добавить книгу", { action: :new } %></p>
-->

## Layouts (макеты)

### Практика 2: Создание собственного макета для страницы книг

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

### Практика 3: Создание именнованного компонента в макете

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
- Обновить заголовок на странице добавления книги (например, "Book Store: Добавление книги").

## Partials

### Практика 4: Создание частичного шаблона

- Переместить информацию о книге из шаблона `app/views/books/index.html.erb` в частичный шаблон `app/views/books/_book.html.erb`
- Вызвать рендеринг частичного шаблона в `app/views/books/index.html.erb` разными способами, каждый раз перезагружая страницу:

  `app/views/books/index.html.erb`
  ```erb
  ...
  <% @books.each do |book| %>
    <%= render book %>
    <%#= render 'book', book: book %>
    <%#= render partial: 'book', locals: { book: book } %>
    <%#= render partial: 'books/book', locals: { book: book } %>
  <% end %>
  ...
  ```

- Cоздать макет для частничного шаблона:

  `app/views/books/_book_layout.html.erb`
  ```erb
  <div id="<%= dom_id book %>">
    <%= yield %>
  </div>
  ```

- Отрендерить частичный шаблон созданным макетом:
  `app/views/books/index.html.erb`
  ```erb
  ...
  <% @books.each do |book| %>
    <%= render partial: 'book', layout: 'book_layout', locals: { book: book } %>
  <% end %>
  ...
  ```
- Перезагрузить страницу, открыть панель разработчика в браузере (`Ctrl + Shift + I` или `F12`) и проверить, что для каждой книги создан блок с её идентификатором.

### Практика 5: Упрощение шаблона

- Упростить вывод ФИО автора и привести разметку частичного шаблона к следующему виду:

  ```erb
  <p><%= book.title %></p>
  <p>Автор: <%= book.author %></p>
  <p>Жанр: <%= book.genre %></p>
  <br>
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
-->

## Helpers

### Практика 6: Подключение стилей с помощью `stylesheet_link_tag`

- Добавить стили для элементов:

  `app/views/books/index.html.erb`
  ```erb
  <div id='books' class='space-y'>
  ...
  </div>
  ```

  `app/views/books/_book_layout.html.erb`
  ```erb
  <div id="<%= dom_id book %>" class="book">
    ...
  </div>
  ```

  `app/views/books/_book.html.erb`
  ```erb
  <div class="book__cover">
    <%= image_tag "book", alt: "Обложка книги" %>
  </div>

  <div class="book__info">
    <p class="book__title"><%= book.title %></p>
    <p>Автор: <span><%= book.author.to_s(full: true) %></span></p>
    <p>Жанр: <span><%= book.genre %></span></p>
  </div>
  ```

  `app/views/layouts/main.html.erb`
  ```erb
  ...
  <body class='container'>
    <div class='content'>
      <%= yield %>
    </div>
  </body>
  ...
  ```


- Подключить специальный файл стилей `app/assets/stylesheets/books.css` в макет страницы книг:

  `app/views/layouts/main.html.erb`
  ```erb
  ...
  <head>
    ...
    <%= stylesheet_link_tag "books" %>
    ...
  </head>
  ...
  ```

- Перезагрузить страницу со списком книг `/books`.

### Практика 7: Создание ссылок с помощью `link_to`

7.1) Добавление меню с навигационными ссылками:

- Отрендерить частичный шаблон меню `app/views/shared/_header.html.erb` в макете страниц книг:

  `app/views/layouts/main.html.erb`

  ```erb
  <body class='container'>
    <%= render 'shared/header' %>
    ...
  </body>
  ```

- Обновить страницу и убедиться, что такие ссылки в меню, как "Книги", "Вход", "Регистрация", ведут на текущую страницу.

- Указать атрибут `href` у ссылок "Книги" (`"/books"`), "Вход" (`"/sign_in"`), "Регистрация" (`"/sign_up"`). Проверить пути можно в `config/routes.rb`. Убедиться, что ссылки ведут на нужные страницы.

- Заменить теги `<a>` на хелперы `link_to`, указав имя ссылки, её путь (с помощью хелперов путей) и тот же класс html-элемента (`class: 'link'`).

7.2) Добавление макетов для страниц входа и регистрации:

- Создать макет `center_container.html.erb`, необходимый для отображения содержимого страницы в блоке по центру:

  `app/views/layouts/center_container.html.erb`
  ```erb
  <!DOCTYPE html>
    <html>
    <head>
      <title>Book Store: <%= yield :title %></title>
      <meta name="viewport" content="width=device-width,initial-scale=1">

      <%= stylesheet_link_tag "application" %>
      <%= yield :extra_stylesheets %>
      <%= javascript_include_tag "application" %>
    </head>

    <body class='container'>
      <%= render 'shared/header' %>

      <div class='center_content'>
        <%= link_to url_for(:back) do %>
          <div class='icon back_icon'></div>
        <% end %>

        <h1 class='title'><%= yield :title %></h1>

        <%= yield %>
      </div>

    </body>
  </html>
  ```

- Подключить макет в контроллере `LoginController`:

  `app/controllers/login_controller.rb`
  ```rb
  class LoginController < ApplicationController
    layout 'center_container'
    ...
  end
  ```

- Перезагрузить страницы входа и регистрации, проверив то, как они отображаются с учётом макета.

7.3) Создание кнопки перехода в каталог книг:

- Добавить ссылку на страницу книг на стартовой странице сайта:

  `app/views/welcome/start.html.erb`
  ```erb
  ...
  <%= link_to books_path, class: 'row link mt-8' do %>
    <span>Перейти в магазин</span>
    <div class='icon forward_icon'></div>
  <% end %>
  ```

<!--
app/views/shared/_header.html.erb

...
<%= link_to 'Книги', books_path, class: 'link' %>
...
<%= link_to 'Вход', sign_in_path, class: "link" %>
<%= link_to 'Регистрация', sign_up_path, class: "link" %>
...
-->

- Проверить, что ссылка ведёт на нужную страницу.

7.4) Создание кнопки выхода из аккаунта:

- Перейти на страницу входа и ввести данные пользователя по умолчанию `user/user`.

- Рядом с информацией о пользователе в меню отобразить ссылку на выход из текущего аккаунта:

  - маршрут ссылки: `/sign_out`;
  - глагол HTTP, с которым будет выполняться переход по ссылке: `POST`;
  - содержимое ссылки - иконка: `<div class='icon sign_out_icon'></div>`;
  - поясняющий текст при наведении на иконку: 'Выйти';
  - CSS-класс ссылки: `link`.

<!--
<% if @current_user %>
    ...
  <%= link_to sign_out_path, method: :post, class: 'link', title: 'Выйти' do %>
    <div class='icon sign_out_icon'></div>
  <% end %>
<% else %>
   ...
<% end %>
-->

- Проверить, что кнопка выхода из аккаунта выполняет свою функцию.

### Практика 8: Использование `form_tag` и основных хелперов форм: `label_tag`, `text_field_tag`, `submit_tag`

8.1) Генерация тега формы с помощью `form_tag`:

- В форме входа в аккаунт `views/login/sign_in.html.erb` заменить html-тег `<form>` хелпером `form_tag`, найти созданный хелпером html-тег на панели разработчика.

8.2) Использование `label_tag`, `text_field_tag`, `submit_tag`:

- Преобразовать форму входа, применив хелперы форм вместо html-тегов для генерации полей формы, все атрибуты полей должны быть сохранены.

- Сверить сгенерированные хелпером html-теги и их атрибуты;

- Для заблокированного состояния кнопки "Войти" изменить текст кнопки на "Подождите...".

- Проследить изменение текста затем после нажатия и блокировки кнопки "Войти" (если вход будет очень быстрым, можно добавить `byebug` или `sleep(5)` в соответствующий метод контроллера).

8.3) Создание формы редактирования книги:

- Указать специальный макет для шаблона редактирования книги:

  `app/controllers/books_controller.rb`
  ```ruby
  def edit
    render layout: 'center_container'
  end

  ...

  def update
    if @book.update(book_params)
      ...
    else
      render :edit, layout: 'center_container', status: :unprocessable_entity
    end
  ```
- Создать шаблон редактирования книги:

  `app/views/books/edit.html.erb`
  ```erb
  <% content_for :title do %><%= @book.title %><% end %>
  <% content_for :extra_stylesheets do %>
    <%= stylesheet_link_tag 'books' %>
  <% end %>

  <%= render 'form', book: @book %>
  ```

- Создать частичный шаблон для отрисовки формы с атрибутами книги:

  `app/views/books/_form.html.erb`
  ```erb
  <%# генерация <form> для атрибутов book %>
    <% if book.errors.any? %>
      <div class="message error"><%= book.errors.full_messages.join('<br>').html_safe %></div>
    <% end %>

    <% if notice %>
      <div class="message notice"><%= notice %></div>
    <% end %>

    <div class="mt-8">
      <%# генерация <label> для поля title с подписью "Название" %>
      <%# генерация <input type="text"> для поля title %>
    </div>

    <div class="mt-5">
      <%# генерация <label> для поля author_id с подписью "Автор" %>
      <%# генерация <select> для выбора author_id из списка авторов %>
    </div>

    <div class="mt-5">
      <%# генерация <label> для поля author_id с подписью "Автор" %>
      <%# генерация <select> для выбора author_id из списка авторов %>
    </div>

    <div class="mt-8" >
      <%# генерация кнопки отправки формы <input type="submit"> с подпись "Обновить" %>
    </div>
  <%# end %>

- Перейти на http://127.0.0.1:3000/books/1/edit.

- Реализовать генерацию тегов `<form>`, `<label>` и `<input type="text">` для названия книги и `<input type="submit">`.

- Проверить сгенериование html-теги и атрибуты.

- Указать метод `PATCH` для формы, найти сгенерированное скрытое поле с именем `name="_method"` и значением `value="patch"`.

- Проверить, что обновление заголовка книги работает.

<!--
<%= form_tag book_path(book), method: 'patch' %>
  <% if book.errors.any? %>
    <div class="message error"><%= book.errors.full_messages.join('<br>').html_safe %></div>
  <% end %>

  <% if notice %>
    <div class="message notice"><%= notice %></div>
  <% end %>

  <div class="mt-8">
    <%= label_tag 'title', 'Название' %>
    <%= text_field_tag 'title', book.title %>
  </div>

  <div class="mt-5">
    <%# генерация <label> для поля author_id с подписью "Автор" %>
    <%# генерация <select> для выбора author_id из списка авторов %>
  </div>

  <div class="mt-5">
    <%# генерация <label> для поля author_id с подписью "Автор" %>
    <%# генерация <select> для выбора author_id из списка авторов %>
  </div>

  <div class="mt-8" >
    <%= submit_tag 'Обновить' %>
  </div>
<%# end %>
-->

- ### Практика 9: Создание чекбокса с помощью `check_box_tag`

- Скопировать отображение сообщения об ошибке и форму входа в шаблон регистрации пользователя `views/login/sign_up.html.erb`, заменив ссылку формы и текст основной кнопки ("Зарегистрироваться").

- Добавить чекбокс "Вы администратор?" над кнопкой "Зарегистрироваться":

  ```ruby
  <div class="mt-5">
    <%= label_tag 'is_admin', 'Вы администратор?' %>
    <%= check_box_tag 'is_admin', '1', false %>
    <span>Да</span>
  </div>
  ```

- Создать администратора, проверив `params` в контроллере.

- Попробовать создать обычного пользователя;

- Доработать метод `user_params` так, чтобы создание обычного пользователя было возможным;

<!--
def user_params
  {
    login: params[:login],
    is_admin: params[:is_admin] == '1',
    password: params[:password]
  }
end
-->

- Сделать чекбокс отмеченным по умолчанию, но недоступным для редактирования;

<!--
<%= check_box_tag 'is_admin', '1', true, disabled: true %>
-->

- Создать пользователя, посмотреть пришедшие в контроллер параметры и проверить роль созданного пользователя (администратор или обычный пользователь).

<!--
При "disabled: true" параметр is_admin не передаётся, будет создан обычный пользователь.
-->

- ### Практика 10: Передача скрытых значений с помощью `hidden_field_tag`

- Исправить последний сценарий из практики 9, добавив `hidden_field_tag` со значением по умолчанию для неотмеченного чекбокса. Проверить, что при заблокированном, но отмеченном чекбоксе будет создан пользователь с правами администратора.

- Добавить возможность редактирования книги администатору (переменная `@is_admin` устанавливается в `ApplicationController`):

  `app/views/books/_book.html.erb`
  ```erb
  ...

  <% if @is_admin %>
    <div class="pr-4">
      <%= link_to 'Редактировать', edit_book_path(book), class: 'book__edit' %>
    </div>
  <% end %>
  ```

- Проверить, что кнопка редактирования в списке книг для созданного администратора появилась.

- ### Практика 11: Использование `select_tag` и `options_for_select` для создания выпадающего списка

11.1) Использование `select_tag`:

- На странице редактирования книги (частичный шаблон `app/views/books/_form.html.erb`) создать выпадающий список для выбора автора, добавив `label_tag` и `select_tag` для выбора `author_id`.

- Указать опции выпадающего списка для `select_tag` с помощью метода `raw`:

```erb
  <%
      author_options = Author.all.map do |author|
        "<option value=#{author.id}>#{author.full_name}</option>"
      end
  %>
```

- Проверить обновление автора книги.

<!--
<%= label_tag 'author_id', 'Автор' %>
<%
    author_options = Author.all.map do |author|
      "<option value=#{author.id}>#{author.full_name}</option>"
    end
%>
<%= select_tag 'author_id', raw(author_options) %>
-->

11.2) Использование `options_for_select` для генерации опций выпадающего списка:

- Заменить создание опций для выпадающего списка авторов с помощью `options_for_select`, указав также выбранное значение в списке по умолчанию (идентификатор автора текущей книги) и CSS-класс `select_list`.

<!--
<% authors = Author.all.map { |author| [author.full_name, author.id] } %>
<% author_options = options_for_select(authors, book.author_id) %>
<%= select_tag 'author_id', author_options, class: 'select_list' %>
-->

11.3) Создание выпадающего списка для редактирования жанра книги:

- Добавить `label_tag` и `select_tag` для выбора `genre_id`.

- Заменить метод отправки формы на `PUT`.

- Проверить обновление жанра книги.

<!--
<%= label_tag 'genre_id', 'Жанр' %>
<% genres = Genre.all.map { |genre| [genre.name, genre.id] } %>
<% genre_options = options_for_select(genres, book.genre_id) %>
<%= select_tag 'genre_id', genre_options, class: 'select_list' %>
-->

- ### Практика 12: Использование `form_for` для создания формы

12.1) Использование `form_for` и основных хелперов объекта построителя формы - `FormBuilder`

- Реализовать генерацию формы редактирования с помощью `form_for` и хелперов `FormBuilder`.

- Заменить хелперы `select` и `options_for_select` на `collection_select` для выпадающего списка жанров.

- Проверить, сохранится ли информация о книге.

- Проанализировать пришедшие в контроллер параметры и модифицировать получение параметров книги так, чтобы информация о книге сохранялась (с помощью `require`).

- Добавить новое поле в форму, проверить, будет ли оно отрисовано:

  ```erb
  <div class="mt-8">
    <%= form.label :year, 'Год написания' %>
    <%= form.text_field :year %>
  </div>
  ```

12.2) Взаимозаменяемость хелперов форм:

- Воспользоваться общим хелпером `text_field`, определённом в `ActionView::Helpers::FormHelper`, и ранее рассмотренным хелпером `text_field_tag`, определённом в `ActionView::Helpers::FormTagHelper`, для генерацию поля названия книги.

- Проверить, что в каждом варианте генерация html-тегов с атрибутами и параметры контроллера совпадают, а данные книги сохраняются.

<!--
app/views/books/_form.html.erb

<%= form_for book, method: :put do |form| %>
  <% if book.errors.any? %>
    <div class="message error"><%= book.errors.full_messages.join('<br>').html_safe %></div>
  <% end %>

  <% if notice %>
    <div class="message notice"><%= notice %></div>
  <% end %>

  <div class="mt-8">
    <%= form.label :title, 'Название' %>
    <%= form.text_field :title %>

    <%# Альтернативные варианты: %>
   
    <%# Использование хелпера ActionView::Helpers::FormHelper %>
    <%#= text_field :book, :title %>

    <%# Использование хелпера ActionView::Helpers::FormTagHelper %>
    <%#= text_field_tag 'book[title]', book.title %>
  </div>

  <div class="mt-5">
    <%= form.label :author_id, 'Автор' %>
    <% authors = Author.all.map { |author| [author.full_name, author.id] } %>
    <% author_options = options_for_select(authors, book.author_id) %>
    <%= form.select 'author_id', author_options, { prompt: 'Выберите автора' }, { class: 'select_list' } %>
  </div>

  <div class="mt-5">
    <%= form.label :genre_id, 'Жанр' %>
    <%= form.collection_select :genre_id, Genre.all, :id, :name, { prompt: 'Выберите жанр' }, { class: 'select_list' } %>
  </div>

  <div class="mt-8" >
    <%= form.submit 'Обновить' %>
  </div>
<% end %>



app/controllers/books_controller.rb

def book_params
  params.require(:book).permit(:title, :author_id, :genre_id)
end
-->

- ### Практика 13: Использование хелпера `form_with`

- На странице каталога книг создать кнопку добавления книги, доступную только администратору.

  `app/views/books/index.html.erb`
  ```erb
  ...

  <% if @is_admin %>
    <div class='right_block' >
    <%= link_to 'Добавить книгу', { action: :new }, { class: 'primary_button book__create' } %>
    </div>
  <% end%>

  <% if @books.blank? %>
    ...
  <% end %>
  ```

- Отредактировать шаблон для экшена `new`:

  `app/views/books/new.html.erb`
  ```erb
  <% content_for :title do %>Добавление книги<% end %>
  <% content_for :extra_stylesheets do %>
    <%= stylesheet_link_tag 'books' %>
  <% end %>

  <%= render 'form', book: @book %>
  ```

- Изменить макет по умолчанию контроллера книг на `center_container`, убрать явное указание этого макета в методах `edit` и `update`, добавить указание макета `main` для метода `index`.

- Перейти на страницу добавления книги, попробовать создать книгу.

- Заменить хелпер `form_for` хелпером `form_with`, указав только объект модели;

- Проверить сгенерированный HTTP-метод, с которым будет отправлена форма добавления и редактирования книги.

- В зависимости от типа экшена (`params[:action]`) изменить название кнопки подтверждения формы.

- Проверить работу кнопки добавления и редактирования книги.

- ### Практика 14: Создание пользовательских хелперов

- Вынести логику генерации `author_options` из практики 11 в хелпер `AuthorsHelper` с передачей одного параметра - выбранного значения выпадающего списка.

<!--
app/helpers/authors_helper.rb

module AuthorsHelper
  def author_options(selected = nil)
    authors = Author.all.map { |author| [author.full_name, author.id] }
    options_for_select(authors, selected)
  end
end
-->
