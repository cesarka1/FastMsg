json.extract! pet, :id, :nome, :especie, :tutor_id, :created_at, :updated_at
json.url pet_url(pet, format: :json)
