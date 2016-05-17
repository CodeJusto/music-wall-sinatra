class Vote < ActiveRecord::Base
  # validates :user_id, uniqueness: true, unless: "song_id.nil?"
  validate :id_check

  belongs_to :song 
  belongs_to :user

private
  def id_check
    if Vote.where(user_id: self.user_id, song_id: self.song_id).length > 0
      errors.add(:user_id, 'cannot vote more than once on the same song')
    else
      true
    end
  end
end