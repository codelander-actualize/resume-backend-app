class Student < ApplicationRecord
  has_many :educations, dependent: :destroy
  
end
