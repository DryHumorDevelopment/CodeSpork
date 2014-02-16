class Reply < ActiveRecord::Base
  belongs_to :forum
  validates_presence_of :answer
end
