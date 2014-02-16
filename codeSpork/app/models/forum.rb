class Forum < ActiveRecord::Base
  has_many :replies
  validates_presence_of :title, :question, :tags
end
