json.array! @books do |book|
  json.id book.id
  json.name book.title
  json.year book.year
  json.authors book.author
  json.isbn book.isbn
  json.pages book.pages
  if book.image
    json.image book.image.file
  end
  json.tags book.tag_list
  if book.holder?
    json.holder book.holder
  end
  json.pages book.pages
  json.comments book.comments, :id, :text, :user_id, :book_id
end


