json.array! @books do |book|
  json.id book.id
  json.name book.title
  json.year book.year
  json.authors book.author
  json.isbn book.isbn
  json.pages book.pages
  if book.e_book
    json.e_book book.e_book.file
  end
  if book.description
    json.description book.description
  end
  if book.image
    json.image book.image.file.url
  end
  json.tags book.tag_list
  if book.holder_id
    json.holder book.holder.login
  end
  json.pages book.pages
  json.comments book.comments, :id, :text, :user_id, :book_id
end


