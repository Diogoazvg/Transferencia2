json.array!(@refused_transfers) do |refused_transfer|
  json.extract! refused_transfer, :id
  json.url refused_transfer_url(refused_transfer, format: :json)
end
