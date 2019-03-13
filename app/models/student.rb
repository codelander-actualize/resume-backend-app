class Student < ApplicationRecord

  has_many :educations, dependent: :destroy
  
  has_many :experiences, dependent: :destroy

end
