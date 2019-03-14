class Student < ApplicationRecord

  has_many :educations, dependent: :destroy
  
  has_many :experiences, dependent: :destroy

  has_many :skills, dependent: :destroy
  

end
