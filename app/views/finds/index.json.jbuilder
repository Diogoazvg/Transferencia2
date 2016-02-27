json.array!(@finds) do |find|
  json.extract! find, :id, :NOME, :N_PASTA, :CONDICAO
  json.url find_url(find, format: :json)
end
