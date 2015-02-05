class Student < ActiveRecord::Base
  belongs_to {:parent, :teacher}
  has_secure_password
end
