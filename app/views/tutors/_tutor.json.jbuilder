json.extract! tutor, :id, :nome, :telefone, :email, :cpf, :rg, :created_at, :updated_at
json.url tutor_url(tutor, format: :json)
