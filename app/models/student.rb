class Student < ActiveRecord::Base
  belongs_to {:parent, :teacher}
end
