class Forum < ActiveRecord::Base
  has_many :replies, dependent: :destroy
  validates_presence_of :title, :question, :tags
end
