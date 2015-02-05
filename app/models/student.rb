class Student < ActiveRecord::Base
  belongs_to {:parents, :teachers}
end
