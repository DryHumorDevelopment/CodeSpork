class Forum < ActiveRecord::Base
  validates_presence_of :title, :question, :tags
end
