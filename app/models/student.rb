class Student < ApplicationRecord

  has_many :educations, dependent: :destroy
  
  has_many :experiences, dependent: :destroy

  has_many :capstones, dependent: :destroy

  has_many :skills, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}"
  end

end
