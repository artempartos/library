module ApplicationHelper
  def han(model, attribute)
    model.to_s.classify.constantize.human_attribute_name(attribute)
  end

  def book_collection(library)
    ids = library.books.map{|x| x.id}.uniq
    Book.web.ransack(id_not_in: ids ).result
  end
end
