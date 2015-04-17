class Note < ActiveRecord::Base
  belongs_to :user
  scope :ordered, -> { order('created_at DESC') }
end
