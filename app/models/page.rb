class Page < ActiveRecord::Base
  def self.info
    return @info = {
        :changelogs => Changelog.all.order(id: :desc).limit(5),
        :users => User.all,
        :forums => {
            :all => Forum.order(updated_at: :desc).limit(5),
            :html => Forum.where("tags like ?", "%html%").order(updated_at: :desc).limit(5),
            :responsive => Forum.where("tags like ?", "%responsive%").order(updated_at: :desc).limit(5),
            :vb => Forum.where("tags like ?", "%vb%").order(updated_at: :desc).limit(5),
            :csharp => Forum.where("tags like ?", "%csharp%").order(updated_at: :desc).limit(5),
            :asp => Forum.where("tags like ?", "%asp%").order(updated_at: :desc).limit(5),
            :rb => Forum.where("tags like ?", "%rb%").order(updated_at: :desc).limit(5),
            :rails => Forum.where("tags like ?", "%rails%").order(updated_at: :desc).limit(5),
            :php => Forum.where("tags like ?", "%php%").order(updated_at: :desc).limit(5),
            :js => Forum.where("tags like ?", "%js%").order(updated_at: :desc).limit(5),
            :jq => Forum.where("tags like ?", "%jq%").order(updated_at: :desc).limit(5),
            :mobile => Forum.where("tags like ?", "%mobile%").order(updated_at: :desc).limit(5)
        }
    }
  end
end
