json.array!(@transfers) do |transfer|
  json.extract! transfer, :id, :NOME_PESSOA, :DESC_TURNO, :PERIODO_ATUAL, :COD_TURMA, :desc_turno
  json.url transfer_url(transfer, format: :json)
end
