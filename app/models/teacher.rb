class Teacher < ActiveRecord::Base
  has_many {:parents, :students}

end
