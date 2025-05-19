class Pet < ApplicationRecord
  belongs_to :tutor
  belongs_to :veterinario
end
