class Tweet < ActiveRecord::Base
  validates :body, presence: true, length: { maximum: 140 }
  validates :user, presence: true

  def character_count
    body.length
  end
end