likeable_array_type = ['Article', 'Comment']

30.times do 
  count = User.count
  random_offset = rand(count)
  random_user = User.offset(random_offset).first
  
  selected_type = likeable_array_type.sample

  if selected_type == 'Article'
    count2 = Article.count
    random_offset2 = rand(count2)
    selected_id = Article.offset(random_offset2).first.id
  else 
    count2 = Comment.count
    random_offset2 = rand(count2)
    selected_id = Comment.offset(random_offset2).first.id
  end

  PolyLike.create(
    user_id: random_user.id,
    likeable_type: selected_type,
    likeable_id: selected_id,
  )

end




# 10.times do 
#   count = User.count
#   random_offset = rand(count)
#   random_user = User.offset(random_offset).first
#   Article.create(
#     title: Faker::Lorem.sentence(word_count: 4, supplemental: true, random_words_to_add: 3),
#     body: Faker::Lorem.paragraph(sentence_count: 8, supplemental: true, random_sentences_to_add: 4),
#     status: 'public',
#     user_id: random_user.id
#   )
# end

20.times do 
  count = User.count
  random_offset = rand(count)
  random_user = User.offset(random_offset).first

  count2 = Article.count
  random_offset2 = rand(count2)
  random_article = Article.offset(random_offset2).first

  Comment.create(
    body: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4),
    status: 'public',
    user_id: random_user.id,
    article_id: random_article.id
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