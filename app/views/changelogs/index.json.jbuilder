json.array!(@changelogs) do |changelog|
  json.extract! changelog, :id, :user, :content, :date
  json.url changelog_url(changelog, format: :json)
end
