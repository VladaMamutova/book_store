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
