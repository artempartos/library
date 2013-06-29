admin = User.find_or_initialize_by_email("admin@bk.ru")
admin.password = 123456
admin.password_confirmation = 123456
admin.admin = true
admin.save!

user = User.find_or_initialize_by_email("user@bk.ru")
user.password = 123456
user.password_confirmation = 123456
user.save!

