class Agendamento < ApplicationRecord
  belongs_to :pet
  belongs_to :veterinario
end
