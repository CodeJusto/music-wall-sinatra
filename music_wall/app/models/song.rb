class Song < ActiveRecord::Base
  validates :title, :author, presence: true
  # validates :url, format: { with: /^www\..+\.\w*/ }
end