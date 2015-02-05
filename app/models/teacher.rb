class Teacher < ActiveRecord::Base
  has_many {:parents, :students}
  has_secure_password
end
