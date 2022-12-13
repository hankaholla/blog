
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do 
  count = User.count
  random_offset = rand(count)
  random_user = User.offset(random_offset).first
  Article.create(
    title: Faker::Lorem.sentence(word_count: 4, supplemental: true, random_words_to_add: 3),
    body: Faker::Lorem.paragraph(sentence_count: 8, supplemental: true, random_sentences_to_add: 4),
    status: 'public',
    user_id: random_user.id
  )
end

# User.create([{
#     first_name: "Joey",
#     last_name: "Tribbiani",
#     user_name: "joeytrib",
#     password: "joey123"
#   },
#   {
#     first_name: "Monica",
#     last_name: "Geller",
#     user_name: "monicagel",
#     password: "monica123"
#   },
#   {
#     first_name: "Ross",
#     last_name: "Geller",
#     user_name: "rossgel",
#     password: "ross123"
#   },
#   {
#     first_name: "Rachel",
#     last_name: "Green",
#     user_name: "rachgreen",
#     password: "rach123"
#   },
#   {
#     first_name: "Phoebe",
#     last_name: "Buffay",
#     user_name: "phoebebuff",
#     password: "phoebe123"
#   },
#   {
#     first_name: "Chandler",
#     last_name: "Bing",
#     user_name: "chanbing",
#     password: "chan123"
#   }])
# User.create(first_name: "Anna", last_name: "Holla", user_name: "annaholla", password: "12345")