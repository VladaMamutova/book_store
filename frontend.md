---
marp: true
theme: academy
paginate: true

size: 4:3
---
<style>
table {
  height: 40%;
  width: 100%;
  color: black;
  border: 1px solid grey;
  padding: 10px;
}

th {
  font-weight:700;
  align: left;
  padding: 10px;
  border: 1px solid grey;
  font-size: 25px;
}

td {
  text-align: left;
  padding: 10px;
  border: 1px solid grey;
}

.comment {
  color: gray;
  font-style: italic;
  font-size: smaller;
}
</style>

<!-- _class: start -->

---
<!-- _class: big green -->

<div class="row">
  <div class="col-4">

  ![height:250px; align: left](images/photo.png)

  </div>

  <div class="col-8">

  # Влада Мамутова
  <br>

  ## TeamLead, разработчик
  </div>
</div>

<br>

## Опыт работы
В Лиге: **1 год**
<br>

## Проекты
СЭД МВД

---
<!-- _class: green section -->

# Frontend
## в Ruby on Rails

---
<!-- _class: red points-2 -->

# План занятия
<br>

1. Три кита фронтенда
2. Action View в Ruby on Rails
3. Templates, Layouts, Partials
4. Helpers
5. Coffee Script

---
<!-- class: blue -->
<!-- _class: blue section-->

# Три кита <br> фронтенда
<br>

## HTML, CSS, JavaScript

---
## Основа фронтенда
<br><br><br>

<div class="row">
  <div class="col-4">

  ### HTML
  #### <span class="comment">каркас</span>
  <br>

  - <ins>H</ins>ypertext <ins>M</ins>arkup <ins>L</ins>anguage
  - язык разметки
  - используется для структурирования и отображения веб-страницы и её контента

  </div>

  <div class="col-4">

  ### CSS
  #### <span class="comment">внешний вид</span>
  <br>

  - <ins>C</ins>ascading <ins>S</ins>tyle <ins>S</ins>heets
  - язык иерархических правил (таблица стилей)
  - используется для представления внешнего вида документа

  </div>

  <div class="col-4">

  ### JS
  #### <span class="comment">интерактивность</span>
  <br>

   - <ins>J</ins>ava <ins>S</ins>cript
   - язык сценариев, интерпретируемый, мультипарадигменный язык
   - взаимодействие с пользователем, обработка данных, кэширование, анимация, формирование запросов к серверу

  </div>
</div>

<!-- 
JS
- Почему интерпретируемый?
Выполняется без перевода в машинный код, выполняется налету в браузере. 
Выполнение кода веб-страницы прямо в браузере на компьютере пользователя снижает нагрузку на сервер: часть операций выполняется без запросов к нему, что экономит время и трафик.
- Почему мультипарадигменный?
Поддерживает разные парадигмы (стили) программирования:
Объектно-ориентированный (отношения между объектами – наборы данных и функции), 
Императивный (последовательные инструкции)
Функциональный - (вычисление математических функции)
-->

---

## HTML
<br>

<div class="row">
  <div class="col-6">

  - Описывается тегами:

  `<h1>`, `<h2>`, `<p>`, `<table>`,
  `<ol>`, `<ul>`, `<li>`, `<a>`, `<img>`...

  </div>

  <div class="col-6">

  ![height:100px](./images/html_tag.png)

  </div>
</div>

<hr>

<div class="row">
  <div class="col-7">

  ```html
  <!DOCTYPE html>
  <html>
    <head>
      <meta charset="utf-8">
      <title>Моя тестовая страница</title>
      <link rel="stylesheet" href="css/style.css">
      <script src="js/script.js"></script>
    </head>
    <body>
      <img src="logo.png" alt="Логотип">
    </body>
  </html>
  ```

  </div>
  
  <div class="col-6">

  <br><br><br>

  ![height:212px](./images/web_page.png)

  </div>
</div>

---
## CSS

<div class="row">
  <div class="col-5">
  <br>

  - Описывается набором правил

  <br>

  - Каждое правило состоит из селектора и блока объявлений - пар "свойство-значение"

  ```css
  селектор, селектор { 
     свойство: значение;
     свойство: значение;
  }
  ```

  <!-- Селектор определяет, на какие части документа распространяется правило. Блок объявлений помещается в фигурные скобки и состоит из одного или более объявлений, разделенных точкой с запятой. -->

  <br>

  - Различают селекторы тегов, классов, идентификаторов, атрибутов...

  ```html
  <h1>Заголовок</h1>
  <div id="content">
    <p class="error">Ошибка</a>
    <a href="#top">Наверх</a>
  </div>
  ```

  </div>

  <div class="col-1"></div>
  <div class="col-5">

  ```css
  /* Селекторы тегов */
  h1, h2, h3 {
     font-family: sans-serif;
  }
  /* Селектор класса */
  .error {
      color: red;
  }
  /* Селектор идентификатора */
  #content {
     height: 200px;
  }
  /* Селектор атрибута */
  a[href^="#"] {
    font-weight: bold;
  }
  /* Селектор дочернего эл-та */
  div > p {
    color: blue;
  }
  /* Селектор псевдоклассов */
  a:active { 
     color: blue;
  }
  ```

  </div>
</div>

---
## JS

- Переменные: `var`, `let`, `const`
- Типы данных: `String`, `Number`, `Boolean`, `Array`, `Object`
- Операторы: математические, логические, операторы циклов...
- Функции: `function fun(arg)`
- События: `onclick`, `onchange`, `onmouseover` и др.

```html
<script>
var colors = ["green", "yellow", "blue"];
var i = 0; 

function changeColor() {
    document.body.style.background = colors[i]; 
    i++;
    if (i > colors.length - 1) {
        i = 0;
    }
}
</script>

<button onclick="changeColor();">Change background</button>
```

---
## Методология БЭМ
<br>

- БЭМ (Блок, Элемент, Модификатор) — компонентный подход к веб-разработке.

<br>

- Блок - независимый интерфейсный компонент.
- Элемент — это составная часть блока.
- Модификатор — это свойство блока или элемента, задающее изменения в их внешнем виде или поведении.

<br>

- В основе БЭМ лежит принцип разделения интерфейса на независимые блоки. Он позволяет легко и быстро разрабатывать интерфейсы любой сложности, повторно использовать существующий код, избегая «Copy-Paste», упроситить понимание кода и создать общий язык для всех участников проекта.

<br><br>

### Документация:
https://ru.bem.info/methodology/

<!--
В БЭМ-методологии сформированы принципы для всех составленых частей фронтенда: HTML, CSS и JS.
-->

---
## Панель разработчика
<br>

<div class="row">
  <div class="col-4"></div>

  **`CTRL + SHIFT + I`** или **`F12`**

</div>

![height:440px](./images/browser_console.png)

---
<!-- class: red -->
<!-- _class: red section-->

# Action View <br> в Ruby on Rails

---
## Структура MVC-приложений
<br>

<div class="row">
  <div class="col-6">

  ![height:440px](./images/mvc.png)

  </div>

  <div class="col-6">

  <br><br><br><br><br><br><br><br><br>

  - **Model** — бизнес-модель, бизнес-логика приложения 
  - **View** — пользовательский интерфейс
  - **Controller** — обработка событий пользовательского интерфейса

  <br>

  **В Ruby on Rails:**

  - `Model → Active Record`
  - `View → Action View`
  - `Controller → Action Controller`

  </div>
</div>

<!--
MVC является архитектурным паттерном для создания гибких и легко расширяемых приложений с пользовательским интерфейсом. Концепция была предложена в 1978 году создателями Smalltalk, реализована в Smalltalk-80, а окончательно описана в 1988 году, однако данный шаблон остаётся чрезвычайно актуальным по сей день.

Суть схемы MVC в разделении трёх основных элементов любого приложения с пользовательским интерфейсом:
* Model (Модель) - это бизнес-модель, или объект предметной области, она является «сутью» приложения и отвечает за непосредственные алгоритмы, расчёты и тому подобное внутреннее устройство приложения. Также предоставляет линк к хранилищу данных;
* View (Представление) - это элементы пользовательского интерфейсы, представление предназначено для вывода данных, предоставленных Моделью. Это единственная часть MVC, которая непосредственно контактирует с пользователем;
* Controller (Контроллер) - отслеживает события пользовательского интерфейса, получает данные от пользователя и передаёт их в Модель, затем получает сообщения от Модели и передаёт их в Представление;

Ruby on Rails реализует паттерн MVC и содержит три компонента:
- Active Record для Модели
- Action View для Представления
- Action Controller для Контроллера
Мы поговорим об Action View.
-->

---
## Организация файлов View
<br>

![height:500px](./images/view_structure.png)

<!--
Описать, какие директории используется для файлов html, js, css:

- Для представления в проекте Rails предусмотрена папка views. Здесь располагаются шаблоны Action View (*.html.erb, *.js.erb), которые пишутся с помощью HTMl-тегов, смешанных с тегоми встроенного Ruby (ERB).

- Наборы css- и js-файлов (ассеты), располагаются в директории app/assets. Здесь также могут располагаться файлы, которые необходимо дополнительно обработать препроцессорами JS и CSS - такие файлы будут иметь расширения .css.scss, .scss.erb, .js.coffee, coffee.erb и т.п. - поговорим позже).

- Также ассеты могут быть расположены в поддиректориях корневой папки public: images, javascripts и stylesheets. Но такие ассеты будут не будут проходить дополнительную обработку препроцессорами и будут отдаваться приложением или веб-сервером как статичные файлы, при этом в приложении необходимо установить специальную переменную конфигурации (config.public_file_server.enabled = true). Таким образом, предпочтительным местом расположения ассетов является директория app/assets. При этом в production Rails прекомпилирует файлы из папки app/assets в папку public/assets.
  
- Если ассеты не связаны напрямую с приложением, а используются для собственных библиотек, являются общими для нескольких приложений, то они размещаются в lib/assets.

- Если ассеты принадлежат сторонним субъектам, таким как код плагинов JavaScript и фреймворков CSS, то они располагаются в папке vendor/assets.
-->

---
## Компиляция файлов. Библиотека Sprockets
<br>

- **Sprockets** - это библиотека Ruby для компиляции и обслуживания веб-ресурсов.

<br>

- **Особенности**:
  - соединение ассетов → *уменьшение количество запросов, необходимых браузеру для отображения страницы*;
  - минимизация или сжатие ассетов → *уменьшение объёма трафика*;
  - использование ассетов на языках более высокого уровня (Sass для CSS, CoffeeScript для JavaScript, ERB для обоих) с дальнейшей прекомпиляцией → *повышение скорости и удобства работы программиста*.

<!--
Особенности Sprockets:

- Первой особенностью является соединение ассетов. Sprockets соединяет все JavaScript файлы в один главный файл .js и все CSS файлы - в один главный файл .css. В production Rails вставляет метку SHA256 в каждое имя файла, таким образом файл кэшируется браузером. Кэш можно сделать недействительным, изменив эту метку, что происходит автоматически каждый раз, когда изменяется содержимое файла. Соединение файлов позволяет уменьшать количество запросов, необходимых браузеру для отображения страницы. Так как браузеры ограничены в количестве параллельно выполняемых запросов, то благодаря такому методу обеспечивается более быстрая загрузка приложения.

- Второй особенностью файлопровода является минимизация или сжатие ассетов. Для файлов CSS это выполняется путем удаления пробелов и комментариев. Для JavaScript могут быть применены более сложные процессы. Существует большое количество минификаторов, в которых реализован разный набор оптимизаций. Основные оптимизации: укорачивание локальных переменных, объединение и удаление локальных переменных, уничтожение недостижимого кода, разворачивание if-веток, переписывание синтаксических конструкций, инлайнинг функций и переменных. Уменьшение размера файла (компрессия) позволяет браузер быстрее их скачивать размер файла, что также ускоряет загрузку приложения и уменьшает трафик.

- Третьей особенностью файлопровода является то, что он позволяет писать ассеты на языке более высокого уровня с дальнейшей прекомпиляцией до фактического ассета. Поддерживаемые языки по умолчанию включают Sass для CSS, CoffeeScript для JavaScript и ERB для обоих. Использование препроцессов облегчает и ускоряет работу программиста.
-->

<br>

- **Устройство работы**: Sprockets загружает файлы, указанные в *манифесте*, обрабатывает их при необходимости (для erb, sass, coffee), соединяет в отдельный файл и производит сжатие.

<br>

<span class="comment">

  **Файл манифеста** определяет, какие ассеты и в каком порядке необходимо сгруппировать в один единственный файл, который затем будет использоваться приложением.

</span>

---
## Компиляция файлов. Поиск файлов

<div class="row">
  <div class="col-6">

  1. Файлы манифестов:

  ### `app/assets/javascripts/application.js`
  ```js
  ...
  //= require jquery
  //= require lib/bootstrap
  //= require_tree .
  ```

  ### `app/assets/stylesheets/application.css`
  ```css
  /* ...
  *= require_self
  *= require_tree .
  */
  ```

  <!--
  В примерах в файлах используются директивы require, require_tree, require_self (директивы начинаются символами "//=" в js и *= в css):
  - Директива require используется, чтобы указать Sprockets на требуемые файлы. В манифесте js затребованы файлы jquery.js и lib/bootstrap.js. Расширение файла явно не указывается. Если require выполняется из .js-файла, то Sprockets предполагает, что подключаются .js-файлы, если из .css-файла - подключаются .css-файлы.
  - Директива require_tree говорит Sprockets рекурсивно включить все файлы JavaScript в указанной директории в результирующий файл. Эти пути должны быть определены только относительно файла манифеста. Также можно использовать директиву require_directory, включающая все файлы JavaScript только в определенной директории, без рекурсии.
  - Директива require_self помещает CSS, который содержится в текущем файле (если есть), в место расположения директивы.
  -->

  </div>

  <div class="col-6">

  2. Подключение файлов манифеста в индексный файл *.html.erb
  ### `app/views/layouts/application.html.erb`

  ```erb
  <html>
    <head>
      ...
      <%= stylesheet_link_tag "application", media: "all" %>
      <%= javascript_include_tag "application" %>
    </head>
    <body> ... </body>
  </html>
  ```

  </div>
</div>

<div class="row">
  <div class="col-3"></div>
  <div class="col-7">

  3. Поиск файлов в порядке приоритета:

  ### `puts Rails.application.config.assets.paths`
  ```
  /usr/src/app/app/assets/javascripts
  /usr/src/app/app/assets/stylesheets
  /usr/src/lib/assets/javascripts
  /usr/src/lib/assets/stylesheets
  /usr/src/app/vendor/assets/javascripts
  /usr/src/app/vendor/assets/stylesheets
  ```

  </div>
</div>

<!--
Пути обходятся в том порядке, в котором они выводятся в пути поиска (можно посмотреть с помощью puts Rails.application.config.assets.paths). Порядок поиска файлов - сверху вниз. Это означает, что файлы в папке app/assets имеют преимущество над файлами в папках lib и vendor (если пути в папках app/assets и lib/assets, vendor/assets совпадали, то первые пути перекроют вторые и третьи).
-->

---
## Статика в production
<br>

- В среде production Sprockets использует *схему меток*.
- **Метки (fingerprinting)** — техника, реализующая зависимость имени файла от его содержимого.
- При изменении файла меняется имя файла.
- Для редко обновляемых (статичных) файлов схема меток является простым способом определить, идентичны ли две версии файла, даже если они находятся на разных серверах, загружены в разное время.
- Во время прекомпиляции из содержимого компилированных файлов генерируется SHA256 и вставляется в имена файлов, когда они записываются на диск. Эти имена меток используются хелперами Rails.
  
<br>

- Примеры генерации ссылок в production:

```ruby
<%= javascript_include_tag "application" %>
# => <script src="/assets/application-908e25f4bf641868d8683022a5b62f54.js"></script>

<%= asset_path "application.js" %>
# => "/assets/application-908e25f4bf641868d8683022a5b62f54.js"
```

---
## Препроцессоры
<br>

- После сбора ассетов Rails подготавливает их для макета, выполняя их *предварительную обработку*.
- Расширение, используемое в названии файла ассета, указывает на порядок обработки файла с помощью препроцессоров. Порядок обработки - *справа налево*.
- Наиболее употребительными являются препроцессорами являются: Sass для css (`.scss`), CoffeeScript для JS (`.coffee`), и ERb для HTML (`.erb`).

<br>

- Примеры порядка обработки файлов препроцессорами:
```
app/assets/stylesheets/books.scss.erb → ERB → SCSS → CSS
app/assets/javascripts/books.coffee.erb → ERB → CoffeeScript → JavaScript
app/assets/javascripts/books.html.erb → ERB → HTML
```

<!--
app/assets/stylesheets/books.scss.erb сначала обрабатывается как ERB, затем SCSS и, наконец, отдается как CSS. То же самое применимо к файлу JavaScript - app/assets/javascripts/books.coffee.erb обрабатывается как ERB, затем CoffeeScript и отдается как JavaScript.

Пример некорректной обработки:
app/assets/javascripts/cards.erb.coffee → сначала будет обработан интерпретатором CoffeeScript, который не понимает ERB, а затем ERB  → возникнут ошибки 

Шаблоны Action View могут быть написаны В разных форматах, не только HTML/
ERb  (html.erb) — генерация HTML
Builder (xml.builder) — генерация XML
Jbuilder (json.jbuilder) — генерация json
-->

---

<!-- class: green -->
<!-- _class: green section-->

# Templates, <br> Partials, <br> Layouts

---

## Формирование HTML-документа
<br>

![height:480px](./images/view_components.png)

---
## Язык описания шаблонов ERb
<br>

- **Embedded Ruby (ERb)** — язык описания шаблонов, который предоставляет возможность вставки в шаблоны исполняемого кода на языке Ruby.

<br>

- **Теги для включения кода Ruby в шаблон:**

`<% %>`  - выполнение кода Ruby
`<%= %>` - включение выполненного кода Ruby в шаблон

<!--
Во время обработки шаблонов ERB просто копирует текст из шаблона в результирующий документ, а обрабатывает только лишь части, помеченные специальными метками. В большинстве шаблонов используются только два типа меток, отличающиеся тем, как обрабатывается Ruby-код внутри их.

Для описания меток используется подход с тегами, начинающимися с последовательности "<%" и заканчивающиеся последовательностью "%>".

Результат обработки шаблона является строка, которая может представлять любой документ: HTML-документ, XML-документ, исходный код и т. д.
-->

<br><br>

<div class="row">
  <div class="col-3"></div>

  <div class="col-6">

  ```erb
  <h1>Names of all the people</h1>

  <%# Выводим список имён людей.%>
  <% @people.each do |person| %>
    Name: <%= person.name %><br>
  <% end %>
  ```

  </div>
</div>

---
<style scoped>
th {
  color: #0c9744;
}
</style>

## Templates. Соглашения по наименованию файлов
<br>

- Для каждого контроллера создаётся папка в `app/views`.
- Имя `view` совпадает с соответствующим `action` контроллера.

<br>

Action Controller <br> `app/controllers/books_controller.rb` | Action View <br> `app/views/books/*`
-----|------
`books_controller#`**`index`** | `app/views/books/`**`index`**`.html.erb`
`books_controller#`**`show`** | `app/views/books/`**`show`**`.html.erb`
`books_controller#`**`new`** | `app/views/books/`**`new`**`.html.erb`
`books_controller#`**`edit`** | `app/views/books/`**`edit`**`.html.erb`
`... ` | `...`
`books_controller#`**`custom_action`** | `app/views/books/`**`custom_action`**`.html.erb`

---
## Templates. Пример шаблона
<br>

### `# app/controllers/books_controller.rb`

```ruby
def index
  @books = Book.all
end
```

### `# app/views/books/index.html.erb`

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

<!-- 
<Практика 1>
-->
---
## Layouts
<br>

- Представляет макет страницы, в который встраивается шаблон.

<br>

- По соглашению макеты располагаются в `app/views/layouts`.

<br>

- По умолчанию название файла макета совпадает с именем контроллера (макет по умолчанию - `/app/views/layouts/application.html.erb`), но можно задавать собственные названия макетов.

<br>

- Для подстановки шаблона в макет используется ключевое слово `yield`.

<br>

- Можно дополнительно задавать именованные `yield` (`yield :nav_bar`). Тогда в конкретном шаблоне можно по-разному отрисовать данный компонент, указав его имя в `content_for` (`content_for :nav_bar`).

<!--
Чтобы найти текущий макет, Rails сначала смотрит файл в app/views/layouts с именем, таким же, как имя контроллера. Если такого макета нет, Rails будет использовать /app/views/layouts/application.html.erb (или, в случае его отсутствия, /app/views/layouts/application.builder).

yield - ключевое слово, которое используется внутри методов, чтобы вызвать блок, переданный в качестве последнего аргумента в этот метод.

<Практика 2>
В качестве блока в макет передаётся шаблон страницы конкретного экшена, который будет отрисовываться с помощью yield в указанном месте в макете страницы.

Вызов content_for сохраняет блок разметки в идентификаторе для последующего использования. Чтобы получить доступ к этому сохраненному контенту в других шаблонах, вспомогательных модулях или макете, необходимо передать идентификатор в качестве аргумента content_for.
-->

---
## Layouts. Пример макета

### `# app/controllers/books_controller.rb`

```ruby
class BooksController < ApplicationController
  layout 'main'

  def index
    @books = Book.all
  end
  ...
end
```

<div class="row">
  <div class="col-6">

  ### `# app/views/layouts/main.html.erb`

  ```erb
  <html>
    <head>
      <%= yield :title %>
    </head>
    <body>
      <%= yield %>
    </body>
  </html>
  ```

  </div>

  <div class="col-6">

  ### `# app/views/books/index.html.erb`

  ```erb
  <% content_for :title do %>
    <title>Book Store: Книги</title>
  <% end %>

  ...
  ```

  </div>
</div>

<!--
<Практика 3>
В качестве аргумента для content_for передаётся идентификатор :title, который при отрисовке макета будет вызван с помощью yield. Таким образом, разметка, определённая в блоке content_for отобразиться вместо yield в макете.
Метод content_for полезен, когда макет содержит отдельные разделы, такие как боковые панели или футеры, в которые нужно вставить свои блоки содержимого. Это также полезно при вставке тегов, загружающих специфичные для страницы файлы JavaScript или css в хедер макета в целом.
-->

---
## Partials
<br>

- Представляет фрагмент шаблона.
- Название файла начинается с нижнего подчеркивания: `_form.html.erb`.
- Для отрисовки partial в шаблоне используется метод `render`.
  ```ruby
  render(options = {}, locals = {}, &block) public
  # options:
  :partial, :file, :inline, :plain, :html, :body, :layout
    partial: 'item' # имя файла в текущей директории или путь от папки views
    layout: 'layout' # макет для partial из папки views
  locals: <argument_hash> - хеш с аргументами, передаваемыми в partial;
  # имя файла в :partial и в :layout указывается без нижнего подчёркивания!
  ```

### Примеры:
```ruby
<%= render item %> # рендеринг файла app/views/items/_item.html.erb
<%= render 'item', item: item %> # передача имени партиала и списка аргументов

# Указание дополнительных опций с обязательной передачей опции :partial.
<%= render partial: 'items/item', locals: { item: item } %>
<%= render partial: 'item', layout: 'item_layout', locals: { item: item } %>
```

<!--
Частные шаблоны, также называемые "партиалы", являются еще одним подходом к разделению процесса рендеринга на более управляемые кусочки. С партиалами можно перемещать код для рендеринга определенных частей отклика в свои отдельные файлы.

<%= render item %>
- поиск partial для модели по умолчанию - по названию модели: если модель у item - Book, то файл фрагмента - views/books/_book.html.erb

<%= render 'item', item: item %>
- можно указать собственное название макета, остальные параметры - локальные переменные, передаваемые в макет


<%= render partial: 'items/item', locals: { item: item } %>
- при передаче дополнительных опций (extra_options) обязательно явное указание 
- в данном случае имя партиала - относительное от папки view, при этом имя айла также начинается с нижнего подчёркивания (отрендериться той же самый файл, что и в первом, и во втором примерах)

<%= render partial: 'item', layout: 'item_layout', locals: { item: item } %>
опции partial (partial: 'item')
- макеты партиалов размещаются не в основной папке app/views/layouts, а в папке с шаблонами app/views/items/_item_layout.html.erb
- имя файла макета для партиала также начинается с нижнего подчёркивания
-->

---
## Partials. Пример фрагмента
<br>

### `# app/views/books/index.html.erb`

```erb
...
<% @books.each do |book| %>
  <%= render partial: 'book', layout: 'book_layout', locals: { book: book } %>
<% end %>
...
```

### `# app/views/books/_book_layout.html.erb`

```erb
<div id="<%= dom_id book %>">
  <%= yield %>
</div>
```

### `# app/views/books/_book.html.erb`

```erb
<p><%= book.title %></p>
<p>Автор: <%= book.author %></p>
<p>Жанр: <%= book.genre.name %></p>
```

<!--
<Практика 4>
dom_id генерирует идентификатор для DOM-элемента. Сгенерированный id состоит из названия объекта или класса, нижнего подчеркивания и идентификатора. Если идентификатор не найден, вместо него используется префикс "new_".

Сейчас в частичном шаблоне дописана какая-то дополнительная логика по форматированию ФИО автора. Гораздо лучше выглядит частичный шаблон на слайде. Давайте приведём шаблон к такому же виду. Какие есть варианты?

<Практика 5>
- Должен ли код форматирования быть во View? Вряд ли, в этом случае он не будет многоразовым, то есть его придется определять каждый раз.
- Должен ли он быть в контроллере? Вряд ли, потому что контроллер должен быть независим от формата представления.
- Должен ли этот код быть в модели? Тоже нет, так как модели описывает требования к полям таблицы в БД, связи между таблицами, выборки данных из таблиц по условиям. То, как будет выведена информация о полях, не должно храниться в моделях.
- Логика для представления может быть вынесена в хелперы, которыми мы познакомимся далее, но есть также и другой подход (decorator и serializer), о котором мы тоже скачем пару слов.
-->
---

<!-- class: blue -->
<!-- _class: blue section-->

# Helpers

---

## Что такое хелперы?

<br>

- Представляют собой вспомогательные методы для рендеринга шаблонов.

<br>

- Бывают:
  - встроенными (например, `javascript_include_tag`, `text_field_tag`, `link_to`, `select_tag` и т. д.),
  - пользовательскими (модуль с методами в папке `app/helpers`).

<!--
Создание разметки может стать монотонным, кропотливым, трудозатратным процессом, а также сложным в поддержке, из-за необходимости обрабатывать имена элементов управления страницы и их множественные атрибуты. Rails устраняет эту сложность, предоставляя хелперы вью для генерации разметки.

Каждый раз при генерации контроллера создаётся и хелпер для него.
-->
---
<style scoped>
th {
  color: #0b75ba;
}
</style>

## Встроенные хелперы: ERb-теги
<br>

ERb tag | HTML tag
-----|------
`javascript_include_tag` <br> `stylesheet_link_tag` | `<script/>` <br> `<link/>`
`image_tag` | `<img/>`
`link_to` <br> `button_to` | `<a/>` <br> `<button/>`
`form_tag (form_for, form_with)` <br> `label_tag (label)` <br> `text_field_tag (text_field)` <br> `check_box_tag (check_box)` <br> `submit_tag (submit)` <br> `select_tag (select)` <br> `options_for_select`, <br> `options_from_collection_for_select` | `<form/>` <br> `<label/>` <br> `<input/>` <br> `<input type="checkbox"/>` <br> `<input type="submit"/>` <br> `<select/>` <br> `<option/>`

---

## Хелпер изнутри на примере `stylesheet_link_tag`

```
<%= stylesheet_link_tag "application", :media => "all" %>
```
<!--
Посмотрим, что скрывается за stylesheet_link_tag.
Уточнить, какой IDE пользуются и знают ли,
что с помощью Ctrl + Click в RubyMine можно перейти к исходному коду выделенного элемента.
Как видим, это обычный метод...
-->

```ruby
# rails/actionview/lib/action_view/helpers/asset_tag_helper.rb
def stylesheet_link_tag(*sources)
  options = sources.extract_options!.stringify_keys
  ...
  sources_tags = sources.uniq.map { |source|
    href = path_to_stylesheet(source, path_options)
    …
    tag_options = {
      "rel" => "stylesheet",
      "crossorigin" => crossorigin,
      "href" => href
    }.merge!(options)
    ...
    tag(:link, tag_options)
  }.join("\n").html_safe
  ...
  sources_tags
end
```

---
## Примеры использования `stylesheet_link_tag`

- Относительные ссылки:
```ruby
stylesheet_link_tag("style")
stylesheet_link_tag "style.css"
# => <link href="/assets/style.css" media="screen" rel="stylesheet" />
```
<!---Так как это обычный метод, то мы можем вызывать его, передавая параметры как в скобках, так и без них, при этом расширение указывать необязательно. -->

- Абсолютные ссылки:
```ruby
stylesheet_link_tag "http://www.example.com/style.css"
# => <link href="http://www.example.com/style.css" media="screen" rel="stylesheet" />
```

- Передача дополнительных параметров:
```ruby
stylesheet_link_tag "style", media: "all"
# => <link href="/assets/style.css" media="all" rel="stylesheet" />
```

<!-- Можно передавать дополнительные атрибуты тега link, которые корректно обработаются helper-ом. По умолчанию media = screen (для экрана монитора). Чтобы сделать применение стилей для всех устройств, передаём all. -->

- Подключение нескольких файлов:
```ruby
stylesheet_link_tag "random.styles", "/css/stylish"
# => <link href="/assets/random.styles" media="screen" rel="stylesheet" />
#    <link href="/css/stylish.css" media="screen" rel="stylesheet" />
```

<!-- Также можем передавать несколько имён файлов, в результате чего будет сгенерировано несколько тегов. -->

<!--
<Практика 6>
Наведём красоту :)
Имена классов названы в соответствии с принципами БЭМ.
-->

---
## Хелпер `link_to` 
<br>

- генерирует гиперссылку - отображает имя ссылки и ссылается на путь
- в html - тег `<a>`

```ruby
link_to(name = nil, options = nil, html_options = nil, &block)

# Options:
data: <attribute_hash> # хэш для пользовательских атрибутов:
   confirm: 'Are you sure?' # переход по ссылке после подтверждения
   disable_with: <text> # отображение текста при disabled-ссылке
method: <http_verb> # указание HTTP-метода (например, 'post' или :post)
remote: true # выполнение Ajax-запроса вместо перехода по ссылке
```

<span class="comment">* С Rails 7 вместо этих опций используются опции библиотеки Turbo.</span>

<!-- confirm - при установки этой опции,при нажатии на кнопку можно вывести окно подтверждение с помощью JS alert

method: <http_verb> генерирует атрибут data-method=<http_verb>

Версии Rails до 7.0 поставлялись по умолчанию поставлялся с библиотекой JavaScript под названием @rails/ujs. После Rails 7 эта библиотека больше не включена по умолчанию. Эта библиотека интегрирована со опциями confirm, disable_with, method, remote.
Теперь используется библиотека Turbo (https://github.com/hotwired/turbo-rails) с методами turbo-confirm, turbo-method; remote уже встроен для каждой ссылки)
-->

### Пример:
```
<%= link_to "Improve Your Ruby Skills", "/ruby-book" %>
```
=>
```html
<a href="/ruby-book">Improve Your Ruby Skills</a>
```

---
## Хелпер `link_to`: генерация путей
<br>

- добавление `resources :books` в `routes.rb` создаёт хелперы путей:

```
books_path           => /books
new_book_path        => /books/new
book_path(:id)       => /books/:id
edit_book_path(:id)  => /books/:id/edit
...

books_url            => schema://host/books
new_book_url         => schema://host/books/new
book_url(:id)        => schema://host/books/:id
edit_book_url(:id)   => schema://host/books/:id/edit
...
```

<!-- Для каждого маршрута используется свой хелпер пути с суффиксом `_path`) -->

<br>
<br>

<span class="comment">

Для просмотра всех путей используйте **`rails routes`**.

</span>

---
## Хелпер `link_to`: примеры использования
<br>

- Варианты использования `link_to` для метода `show`
```ruby
<%= link_to "Book", controller: "books", action: "show", id: @book %>
# => <a href="/books/1">Book</a>

<%= link_to "Book", book_path(@book) %>
# => <a href="/books/1">Book</a>

<%= link_to "Book", @book %>
# => <a href="/books/1">Book</a>
```

<br>

- `link_to` для метода `index`
```erb
<%= link_to "All books", books_path %>
```

<br>

- `link_to` для метода `edit`

```erb
<%= link_to "Edit Book", edit_book_path(@book) %>
```

<br>

---
## Хелпер `link_to`: примеры использования
<br>

- Передача дополнительных параметров запроса:
```ruby
<%= link_to "Novels of the 20th century", 
            books_path(genre: "novel", year_from: "1900") %>
#=> <a href="/books?genre=novel&year_from=1900">Novels of the 20th century</a>
```

- Задание `html_options`:
```ruby
<%= link_to "More Books", books_path, id: "book-link", class: "custom-link" %>
# => <a href="/books" class="custom-link" id="book-link">More Books</a>
```

- Задание параметра `&block`:
```ruby
<%= link_to book_path(@book) do %>
  <%= image_tag @book.cover" %>
<% end %>
```

- Использование опций `:method` и `:data`
```ruby
<%= link_to "Delete Book", @book, method: "delete", data: { confirm: "Are you sure?", disable_with: "Processing" } %>
```

---
## Хелперы форм
<br>

- генерируют формы - основной интерфейс для пользовательского ввода и отправки данных
- в html - тег `<form>`
<br>

### Виды хелперов:

<br>

- `form_tag` - простая форма

<br>

- `form_for` - форма с привязкой к объекту модели

<br>

- `fields_for` - привязывает вложенные объекты модели без создания тега `<form>`

<br>

- `form_with` - заменяет `form_tag` и `form_for` в версиях Rails >= 5.1

<br>

<!--
Формы - основной инструмент для взаимодействия между пользователем и приложением. Они позволяют достаточно просто отправлять данные на сервер. Хелперы форм позволяют значительно упростить работу по генерации форм.
 -->

---
## Хелпер `form_tag`
<br>
- создаёт простую форму без привязки к моделям ActiveRecord

```ruby
form_tag(url_for_options = {}, options = {}, &block)

# Options:
multipart: true # установка в отправляемых данных "multipart/form-data"
method: <method> # метод запроса (по умолчанию - POST)
authenticity_token: <authenticity_token> # выполнение запроса с токеном аутентификации для предотвращения CSRF-атак
remote: true # позволяет отправлять данные формы через AJAX-запрос
```

<!--
Подходит, например, для создания форм поиска.
Все теги, используемые внутри формы имеют окончание *_tag. Все имена полей и значения необходимо указывать самостоятельно.

method - при указании "patch", "put", "delete" в форму добавляется скрытое поле с именем _method с указанием нужного глагода поверх POST-запроса TODO:
-->

<br>

### Пример:

<div class="row">
  <div class="col-6">

  ```erb
  <%= form_tag '/posts' do %>
    <%= search_field_tag 'name' %>
    <%= submit_tag 'Save' %>
  <% end %>
  ```

  </div>

  &#160;=>&#160;&#160;

  <div class="col-6">

  ```html
  <form action="/posts" method="post">
    <input id="name" name="name"
           type="search" />
    <input type="submit" name="commit"        
           value="Save" />
  </form>
  ```
<br>

---
## Основные хелперы для использования внутри `form_tag`
<br>

<br>

- `label_tag`
- `text_field_tag`
- `check_box_tag`
- `select_tag`
- `hidden_field_tag`
- `submit_tag`

<br><br><br><br>

### Полный список хелперов можно найти в документации по FormTagHelper:
https://api.rubyonrails.org/v7.0.3/classes/ActionView/Helpers/FormTagHelper.html

---
## Хелпер `check_box_tag` 
<br>

- генерирует чекбокс - элемент управления, предоставляющий пользователю выбор опции
- в html - тег `<input checked="checked">`

```ruby
check_box_tag(name, value = "1", checked = false, options = {})

# Options:
disabled: true # для отключения возможности редактирования пользователем
```
<!-- Любой другой ключ сформирует стандартную HTML-опцию для тега -->

<br>

### Пример:
```erb
<%= check_box_tag 'receive_email', 'yes', true, class: 'simple-check-box' %>
```
=>
```html
<input checked="checked" class="simple-check-box" id="receive_email" name="receive_email" type="checkbox" value="yes" />
```

<!--
Первый параметр у check_box_tag - это имя поля ввода (генерирует id и name).
Второй параметр - это значение поля ввода. Это значение будет присутствовать в params и будет включено в данные формы, когда чекбокс нажат. TODO: активный?
-->

---
## Хелпер `select_tag`
<br>

- генерирует выпадающий список для выбора опций (как одной, так и нескольких)
- в html - тег `<select>`

```ruby
select_tag(name, option_tags = nil, options = {})

# Options:
multiple: true # для выбора нескольких опций
disabled: true # отключает возможность редактирования пользователем
include_blank: true или <text> # создаёт пустую опцию (может содержать название, но value будет пустым)
prompt: <text> # отображает пустую опцию с подсказкой для выбора значения
```

<!-- Любой другой ключ сформирует стандартную HTML-опцию для тега -->

<br>

### Пример:
```erb
<%= select_tag 'people', raw('<option>David</option>') %>
```
=>
```html
<select id="people" name="people"><option>David</option></select>
```

---
## Хелпер `options_for_select`
<br>

- генерирует список опций для `select_tag`
- в html - тег `<option>`

```ruby
options_for_select(container, selected = nil)

# container - hash, array, enumerable, пользовательский тип, которые отвечают на методы first (для атрибута name) и last (для атрибута value)
# selected - одно или несколько значений, которые будут выбраны по умолчанию (в те опции, у которых value точно совпадёт с одним из представленных в selected, будет добавлен атрибут selected)
```

<!-- Тип selected должен точно совпадать с типом value в опции.
Следует помнить, что значения, извлеченные из хэша params, - это строки! -->

<br>

### Пример:
```erb
<%= options_for_select([['Lisbon', 1], ['Madrid', 2]], 2) %>
```
=>
```html
<option value="1">Lisbon</option>
<option value="2" selected="selected">Madrid</option>
```

<!-- В контроллере в params будет присутствовать именно value (поэтому чаще всего это id из базы данных) -->


---
## Хелпер `hidden_field_tag`
<br>

- генерирует скрытое поле ввода, которое предоставляет возможность передать данные в запросе без необходимости иметь видимое для пользователя поле
- в html - тег `<input type="hidden">`

```ruby
hidden_field_tag(name, value = nil, options = {})
```

<!--
Часто применяется для форм с POST-, PUT-, PATCH-запросами.
Параметр name генерирует атрибуты id и name.
Любой ключ в options создаёт стандартный атрибут тега.
-->

<br>

### Пример:
```erb
<% = hidden_field_tag 'user_id', 'VUBJKB23UIVI1UU1VOBVI@' %>
```
=>
```html
<input id="token" name="token" type="hidden" value="VUBJKB23UIVI1UU1VOBVI@" /> 
```

<!-- Следует помнить, что значения hidden-тегов легко подделать. -->

---
## Основные хелперы для использования внутри `form_for`
<br>

```ruby
# текстовое поле
text_field_tag(name, value = nil, options = {})

# Options:
disabled: true # отключает возможность редактирования пользователем
size: <symbol_number> # размер поля в длину
maxlength: <max_symbols> # ограничение макс. количества символов для ввода
placeholder: <text> # подсказка для поля
```

```ruby
# кнопка для отправки формы
submit_tag(value = "Save changes", options = {})

# Options:
disabled: true # отключает возможность редактирования пользователем
data: <attribute_hash> # хэш для пользовательских атрибутов:
   confirm: 'Are you sure?' # отправка формы по после подтверждения
   disable_with: <text> # отображение текста для disabled-кнопки
```

<!--
disable_with - например, на время обработки запроса после отправки формы блокируем кнопку и отображаем текст (вход в аккаунт)
confirm - при установки этой опции,при нажатии на кнопку можно вывести окно подтверждение с помощью JS alert
-->

<span class="comment">* С Rails 7 вместо опций `confirm`, `disable_with` используются опции библиотеки Turbo.</span>

---
## Хелпер `form_for`
<br>

- создаёт форму с привязкой к модели `ActiveRecord`
- внутри формы используются теги без постфикса `_tag` (в отличие от хелперов для `form_tag`)

<br>

```ruby
form_for(record, options = {}, &block)

# Options
url: <url> # url страницы, на которые будут отправлены данные формы (по умолчанию - на страницу с формой)
namespace: <name> # пространство имён для гарантии уникальности элементов формы
method: <method> # метод запроса (по умолчанию - POST)
authenticity_token: <authenticity_token> # выполнение запроса с токеном аутентификации для предотвращения CSRF-атак
remote: true # позволяет отправлять данные формы через AJAX-запрос
html: <attribute_hash> # хеш с дополнительными HTML-атрибутами для формы
```

<!--
Создает форму, которая позволяет пользователю создавать или обновлять атрибуты отдельной модели (метод attributes у модели).
Метод может работать немного по-разному, в зависимости от того, насколько вы хотите полагаться на Rails (далее рассмотрим на примерах).

namespace: <name> - сгенерированные идентификаторы будут иметь префикс вида _<name> TODO: проверить
method - при указании "patch", "put", "delete" в форму добавляется скрытое поле с именем _method с указанием нужного глагода поверх POST-запроса TODO: проверить
-->

---
## Хелпер `form_for`: примеры использования
<br>

### Пример с передачей названия модели (в виде строки или символа):

```erb
<%= form_for :person do |f| %>
  First name: <%= f.text_field :name %><br />
  Biography : <%= f.text_area :biography %><br />
  Admin?    : <%= f.check_box :admin %><br />
  <%= f.submit %>
<% end %>
```

```html
<form action="/action_url" accept-charset="UTF-8" method="post">
  <input name="utf8" type="hidden" value="✓">
  <input type="hidden" name="authenticity_token" value="token">
    First name: <input type="text" name="user[name]" id="user_name">
    <br>
    Biography: <textarea name="user[biography]" id="user_biography"></textarea><br>
    Admin?: <input name="user[admin]" type="hidden" value="0">
  <input type="checkbox" value="1" name="user[admin]" id="user_admin"><br>
  <input type="submit" name="commit" value="Submit User">
</form>
```

<!--
Принимает название модели в виде символа или строки и блок, в котором используются теги без постфикса _tag. 

f - объект FormBuilder, у которого есть информация о полях модели.

Таким образом, названия полей формы автоматически будут генерироваться так, чтобы соответствовать strong parameters и чтобы с ними без дополнительных действий можно было работать (при условии корректного описания поля).
-->

---
## Хелпер `form_for`: примеры использования
<br>

### Пример с передачей объекта модели:

```erb
<%= form_for @user do |f| %>
  First name: <%= f.text_field :name %><br />
  Biography : <%= f.text_area :biography %><br />
  Admin?    : <%= f.check_box :admin %><br />
  <%= f.submit %>
<% end %>
```

<br><br>

- где `@user` - объект модели `User`

```ruby
=> @user = User.find(1)
# => #<User id: 1, name: "Петя", biography: "Работает в Лиге", admin: true>
```

<!--
Вместо названия модели можно также передавать сам объект модели.
Например, в представление передана переменная @user - существующая запись, которую необходимо отредактировать.
Тогда поля формы автоматически будут проверяться в соответствии с полями объекта и предзаполняться в соответствии со значениями этих полей.
TODO: добавить сгенерированный вариант
-->


---
## Хелперы для использования внутри `form_for`
<br>

- хелперы вызываются у объекта `FormBuilder`
- большинство хелперов являются обёрткой методов у `FormHelper`
- примеры: `label`, `text_field`, `submit`  др. (без постфикса `_tag`)

### Пример определения `text_field`

```ruby
text_field(method, options = {})

# method - поле/метод модели
# options - дополнительные опции html
```

### Пример использования `text_field`

<div class="row">
  <div class="col-5">

```erb
<%= form_for @user do |f| %>
  <%= f.text_field :name %>
<% end %>
```

  </div>

  &#160;=&#160;&#160;

  <div class="col-7">

  ```html
  <form action="/users/1" method="post">
    <input type="text" name="user[name]" 
           value="Петя">
  </form>
  ```

  </div>
</div>


### Документация по FormBuilder с полным перечнем хелперов:
https://api.rubyonrails.org/v7.0.3/classes/ActionView/Helpers/FormBuilder.html


<!--

<div class="row">
  <div class="col-6">

  ```erb
  <%= form_for @user do |f| %>
    <%= f.text_field :name %>
  <% end %>
  ```

  </div>

  &#160;=&#160;&#160;

  <div class="col-6">

  ```erb
  <%= form_tag user_path(@user) do %>
    <%= text_field :user, :name %>
  <% end %>
  ```
  </div>
</div>

<br>


text_field(object_name, method, options = {})

# object_name - название модели (строка или символ)
# method - поле/метод модели
# options - дополнительные опции html
```


## Взаимозаменяемость хелперов форм с и без постфикса `_tag`
<br>


```erb
<%= form_for @user do |f| %>
  <%= f.text_field :name %>
<% end >
```
&#160;&#160;&#160;=

```erb
<%= form_tag :user do |f| %>
  <%= text_field_tag 'user[name]', @user.name %>
<% end >
```

<br>


### Пример совместного использования разных типов тегов
```erb
<%= form_for :user do |f| %>
  First name: <%= f.text_field :first_name %>
  Last name : <%= f.text_field :last_name %>
  Biography : <%= text_area :user, :biography %>
  Admin?    : <%= check_box_tag "user[admin]", "1", @user.company.admin? %>
  <%= f.submit %>
<% end %>
```
-->

<!--
Но зачастую и хелперы могут разрастаться. Причем использование хелперов для форматирования модели также не очень удобно, так как нужно передавать объект модели (и код становится не таким лаконичным).

Decorator - позволяет разгрузить модель, а зачастую и помощники, от избыточной логики представления, например, от часто вызываются в представлении при отображении записи методов, которые обычно преобразуют для вывода какие-либо данные записи. Тут обычно используется бисер draper.
https://github.com/drapergem/draper

Serializer - позволяет разгрузить контроллер и модель от бизнес-логики, и выборки, которая необходима конечному пользователю и запрашиваемая через api-вызовы (имеется ввиду внешняя сериализация). Обычно используется бисер active_model_serializers.
https://github.com/rails-api/active_model_serializers
-->

---
<!-- class: red -->
<!-- _class: red section-->

# Coffee Script

---
<!-- class: blue blue -->

## Итоги
<br>

- Рассмотрели, из чего состоит фронтенд
- Разобрались, как организованы файлы пользовательского интерфейса в проекте Ruby on Rails: где хранятся, как компилируются, как происходит поиск
- Познакомились с Action View: Templates, Layouts, Partials
- Узнали, что такое хелперы: как пользоваться встроенными тегами и как писать собственные хелперы
- Создали пользовательский интерфейс для приложения Book Store
- Рассмотрели основы Coffee Script

---
<!-- _class: blue big list-1 -->

# ВОПРОСЫ?

---

# Всем спасибо!
<!-- _class: finish -->
