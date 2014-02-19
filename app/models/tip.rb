class Tip < ActiveRecord::Base
  validates_presence_of :description, :code, :title
end
