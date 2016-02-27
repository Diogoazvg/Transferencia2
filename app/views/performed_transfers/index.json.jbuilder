json.array!(@performed_transfers) do |performed_transfer|
  json.extract! performed_transfer, :id
  json.url performed_transfer_url(performed_transfer, format: :json)
end
