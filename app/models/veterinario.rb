class Veterinario < ApplicationRecord
   has_many :pets, dependent: :destroy
end
