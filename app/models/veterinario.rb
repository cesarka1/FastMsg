class Veterinario < ApplicationRecord
  has_many :agendamentos, dependent: :destroy
end
