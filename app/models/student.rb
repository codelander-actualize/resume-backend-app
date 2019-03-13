class Student < ApplicationRecord
  has_many :experiences, dependent: :destroy
end
