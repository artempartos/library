json.id @book.id
json.name @book.title
json.year @book.year
json.authors @book.author
json.isbn @book.isbn
json.pages @book.pages
if book.description
  json.description book.description
end
if @book.image
  json.image @book.image.file
end
json.tags @book.tag_list
if book.id.even?
  json.available = true
else
  json.available = false
  json.wait_queue = User.scoped.map(&:login)
end
json.pages = @book.pages
json.comments @book.comments, :id, :text, :user_id, :book_id
