class UserMailer < ApplicationMailer

  def confirmation_instructions(user)
    @user = user
    mail(to: user.email)
  end

  def remind_password(user)
    @user = user
    mail(to: user.email)
  end

  def avaliable_book(user, book, library)
    @user = user
    @book = book
    @company = library.librariable
    mail(to: user.email)
  end

end
