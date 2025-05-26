class Tutor < ApplicationRecord
   has_many :pets, dependent: :destroy
end
