class Tutor < ApplicationRecord
   has_many :pets, dependent: :nullify
end
