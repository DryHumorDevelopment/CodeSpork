json.array!(@flags) do |flag|
  json.extract! flag, :id, :reason, :user_id, :post_id
  json.url flag_url(flag, format: :json)
end
