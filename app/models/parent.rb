class Parent < ActiveRecord::Base
  belongs_to :teacher
  has_many :students
  has_secure_password
end
