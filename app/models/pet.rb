class Pet < ApplicationRecord
  belongs_to :tutor
  has_many :agendamentos, dependent: :destroy
end
