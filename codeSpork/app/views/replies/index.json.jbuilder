json.array!(@replies) do |reply|
  json.extract! reply, :id, :answer, :user_id, :forum_id
  json.url reply_url(reply, format: :json)
end
