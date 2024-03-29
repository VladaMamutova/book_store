# Book Store: создание проекта

## Содержание
<!-- TOC -->
  * [1. Инициализация проекта](#1-инициализация-проекта)
  * [2. Подключение базы данных](#2-подключение-базы-данных)
  * [3. Создание основных моделей и связей между ними](#3-создание-основных-моделей-и-связей-между-ними)
  * [4. Заполнение БД тестовыми данными](#4-заполнение-бд-тестовыми-данными)
<!-- TOC -->
<hr>

## 1. Инициализация проекта

1. Создать папку для проекта и перейти в неё:
    ```bash
    mkdir book_store; cd book_store
    ```
2. Создать `Dockerfile` со следующим содержимым:
    ```
    FROM ruby:2.7
    
    WORKDIR /opt/app
    
    COPY Gemfile* ./
    RUN bundle install
    
    COPY . .
    
    EXPOSE 3000
    
    CMD rails server -b 0.0.0.0
    ```
3. Создать `Gemfile` со следующим содержимым:
    ```
    source 'https://rubygems.org'
    git_source(:github) { |repo| "https://github.com/#{repo}.git" }
    
    gem 'rails'
    ```

4. Собрать образ:
    ```bash
    docker build . -t book_store
    ```

5. Запустить контейнер:
    ```bash
    docker run --rm -it -v $(pwd):/opt/app -u $(id -u):$(id -g) book_store bash
    ```

6. Создать Rails-проект в текущей директории в контейнере
    ```bash
    rails new . --database=postgresql --skip-javascript --skip-test --skip-bundle
    
    # нажимаем 'y' для перезаписи Gemfile
    ```

7. Остановить контейнер с помощью `exit` или `Ctrl + D` и пересобрать образ.

## 2. Подключение базы данных

1. Создать `docker-compose.yml` со следующим содержимым:
    ```yml
    version: '3.7'
    services:
      db:
        image: postgres:13.3
        volumes:
          - postgres:/var/lib/postgresql/data
        environment:
          POSTGRES_USER: postgres
          POSTGRES_PASSWORD: postgres
    
      app:
        build: .
        image: book_store
        volumes:
          - .:/opt/app
        ports:
          - 3000:3000
        depends_on:
          - db
    
    volumes:
      postgres:
    ```

2. В файле `config/database.yml` в секции `default: &default` добавить конфигурационные настройки `host`, `username` и `password` для подключения к БД:

     ```yml
     ...
     default: &default
       adapter: postgresql
       encoding: unicode
       host: db # такой же, как и имя сервиса в docker-compose.yml
       username: postgres
       password: postgres
       pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
     ...
     ```

3. Запустить приложение:
    ```bash
    docker-compose up
    ```

   Проверить доступность приложения по адресу http://127.0.0.1:3000.

## 3. Создание основных моделей и связей между ними

1. Запустить контейнер от имени текущего пользователя:

    ```bash
    docker-compose run --rm -u $(id -u):$(id -g) app bash
    ```
2. Сгенерировать модель, контроллер и представление для сущности `Book`:
    ```bash
    rails generate scaffold Book title:string
    # в миграции для поля title добавить not-null ограничение:
    # t.string :title, null: false
    ```

    <!--
          invoke  active_record
          create    db/migrate/20220518041818_create_books.rb
          create    app/models/book.rb
          invoke  resource_route
           route    resources :books
          invoke  scaffold_controller
          create    app/controllers/books_controller.rb
          invoke    erb
          create      app/views/books
          create      app/views/books/index.html.erb
          create      app/views/books/edit.html.erb
          create      app/views/books/show.html.erb
          create      app/views/books/new.html.erb
          create      app/views/books/_form.html.erb
          create      app/views/books/_book.html.erb
          invoke    resource_route
          invoke    helper
          create      app/helpers/books_helper.rb
          invoke    jbuilder
          create      app/views/books/index.json.jbuilder
          create      app/views/books/show.json.jbuilder
          create      app/views/books/_book.json.jbuilder
    -->

3. Сгенерировать модели `Genre` и `Author`:
    ```bash
    rails generate model Genre name:string
    # в миграции для поля name добавить ограничение "null: false"
    
    rails generate model Author first_name:string middle_name:string last_name:string info:string
    # в миграции для полей first_name и last_name добавить ограничение "null: false"
    ```

4. Сгенерировать файл миграции:
    ```bash
    rails generate migration AddAuthorAndGenreRefToBooks
    ```
   В полученном файле в метод `change` вставить код для добавления ссылок на таблицы (вторичных ключей и индексов):
   ```rb
   add_reference :books, :author, null: false, foreign_key: true
   add_reference :books, :genre, null: false, foreign_key: true
   ```
5. Актуализировать код моделей, добавив необходимые связи:
    ```rb
    # app/models/book.rb
    class Book < ApplicationRecord
      belongs_to :author
      belongs_to :genre
    end
    
    # app/models/author.rb
    class Author < ApplicationRecord
      has_many :books, dependent: :destroy
    end
    ```

6. Запустить миграции для создания таблиц и связей:
    ```bash
    rails db:create
    rails db:migrate
    ```

## 4. Заполнение БД тестовыми данными

1. В `db/seeds.rb` добавить код создания авторов, жанров и книг:
    ```rb
    authors = [
      {
        first_name: 'Александр',
        middle_name: 'Сергеевич',
        last_name: 'Пушкин',
        info: 'Русский поэт, драматург и прозаик, заложивший основы русского реалистического направления, литературный критик и теоретик литературы, историк, публицист, журналист. Один из самых авторитетных литературных деятелей первой трети XIX века.'
      },
      {
        first_name: 'Лев',
        middle_name: 'Николаевич',
        last_name: 'Толстой',
        info: 'Один из наиболее известных русских писателей и мыслителей, один из величайших писателей-романистов мира, участник обороны Севастополя, просветитель, публицист, религиозный мыслитель. Был номинирован на Нобелевскую премию по литературе (1902, 1903, 1904, 1905). Впоследствии отказался от дальнейших номинаций. Ещё при жизни был признан главой русской литературы.'
      },
      {
        first_name: 'Александр',
        middle_name: nil,
        last_name: 'Дюма',
        info: 'Французский писатель, драматург и журналист, один из самых читаемых французских авторов, мастер приключенческого романа. Под именем Дюма вышло огромное количество исторических романов, в написании которых участвовали литературные подёнщики. Помимо романов, его перу принадлежат также пьесы, статьи и книги о путешествиях.'
      },
      {
        first_name: 'Михаил',
        middle_name: 'Юрьевич',
        last_name: 'Лермонтов',
        info: 'Русский поэт, прозаик, драматург, художник. Творчество Лермонтова ознаменовало собой новый расцвет русской литературы и оказало большое влияние на виднейших русских писателей и поэтов XIX и XX веков. Произведения Лермонтова получили большой отклик в живописи, театре, кинематографе. Его стихи стали подлинным кладезем для оперного, симфонического и романсового творчества. Многие из них стали народными песнями.'
      },
      {
        first_name: 'Фёдор',
        middle_name: 'Иванович',
        last_name: 'Достоевский',
        info: 'Русский писатель, мыслитель, философ и публицист, член-корреспондент Петербургской академии наук с 1877 года. Классик мировой литературы, по данным ЮНЕСКО, один из самых читаемых писателей в мире. После смерти Достоевский был признан классиком русской литературы и одним из лучших романистов мирового значения, считается первым представителем персонализма в России.'
      },
      {
        first_name: 'Эрих',
        middle_name: 'Мария',
        last_name: 'Ремарк',
        info: 'Немецкий писатель XX века, представитель «потерянного поколения». Его роман «На Западном фронте без перемен» входит в большую тройку романов «потерянного поколения», изданных в 1929 году, наряду с произведениями «Прощай, оружие!» Эрнеста Хемингуэя и «Смерть героя» Ричарда Олдингтона.'
      },
      {
        first_name: 'Антон',
        middle_name: 'Семёнович',
        last_name: 'Макаренко',
        info: 'Всемирно известный советский педагог, писатель, деятель НКВД Украинской ССР. Выдающиеся достижения в области воспитания и перевоспитания молодёжи, подготовки к её дальнейшей успешной социализации, выдвинули Макаренко в число известных деятелей русской и мировой культуры и педагогики.'
      }
    ]
    authors.each do |author|
      Author.create(
        first_name: author[:first_name],
        middle_name: author[:middle_name],
        last_name: author[:last_name],
        info: author[:info]
      )
    end
    
    genres = ['роман', 'повесть', 'рассказ', 'новелла', 'роман в стихах', 'сказка']
    genres.each { |genre| Genre.create(name: genre) }
    
    novel_id = Genre.find_by(name: 'роман').id
    story_id = Genre.find_by(name: 'повесть').id
    verse_novel_id = Genre.find_by(name: 'роман в стихах').id
    fairy_tale_id = Genre.find_by(name: 'сказка').id
    
    tolstoy_id = Author.find_by(last_name: 'Толстой').id
    dostoevsky_id = Author.find_by(last_name: 'Достоевский').id
    duma_id = Author.find_by(last_name: 'Дюма').id
    remark_id = Author.find_by(last_name: 'Ремарк').id
    pushkin_id = Author.find_by(last_name: 'Пушкин').id
    
    books = [
      { title: 'Война и мир',    genre_id: novel_id,   author_id: tolstoy_id },
      { title: 'Детство',        genre_id: story_id,   author_id: tolstoy_id },
      { title: 'Отрочество',     genre_id: story_id,   author_id: tolstoy_id },
      { title: 'Юность',         genre_id: story_id,   author_id: tolstoy_id },
      { title: 'Анна Каренина',  genre_id: novel_id,   author_id: tolstoy_id },
    
      { title: 'Преступление и наказание', genre_id: novel_id,   author_id: dostoevsky_id },
      { title: 'Идиот',                    genre_id: novel_id,   author_id: dostoevsky_id },
      { title: 'Братья Карамазовы',        genre_id: novel_id,   author_id: dostoevsky_id },
    
      { title: 'Королева Марго',     genre_id: novel_id,   author_id: duma_id },
      { title: 'Три мушкетёра',      genre_id: novel_id,   author_id: duma_id },
      { title: 'Граф Монте-Кристо',  genre_id: novel_id,   author_id: duma_id },
    
      { title: 'Жизнь взаймы',       genre_id: novel_id,   author_id: remark_id },
      { title: 'Чёрный обелиск',     genre_id: novel_id,   author_id: remark_id },
      { title: 'Три товарища',       genre_id: novel_id,   author_id: remark_id },
      { title: 'Триумфальная арка',  genre_id: novel_id,   author_id: remark_id },
    
      { title: 'Евгений Онегин',           genre_id: verse_novel_id,   author_id: pushkin_id },
      { title: 'Пиковая дама',             genre_id: story_id,         author_id: pushkin_id },
      { title: 'Барышня-крестьянка',       genre_id: story_id,         author_id: pushkin_id },
      { title: 'Сказка о рыбаке и рыбке',  genre_id: fairy_tale_id,    author_id: pushkin_id },
      { title: 'Сказка о золотом петушке', genre_id: fairy_tale_id,    author_id: pushkin_id }
    ]
    
    books.each do |book|
      Book.create(
        title: book[:title],
        genre_id: book[:genre_id],
        author_id: book[:author_id]
      )
    end
    ```

2. Выполнить команду для заполнения БД тестовыми данными:
    ```bash
    db:seed
    ```

3. Запустить приложение:
    ```bash
    docker-compose up
    ```

   Проверить, что страница http://127.0.0.1:3000/books открывается и список книг выводится :)
