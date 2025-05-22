class Veterinario < ApplicationRecord
  has_many :agendamentos, dependent: :nullify
end
