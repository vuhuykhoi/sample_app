class Micropost < ApplicationRecord
  belongs_to :user
  scope :create_desc, ->{order(created_at: :desc)}
  scope :owner_posts, ->(user_id){where("user_id = ?", user_id)}
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true,
  length: {maximum: Settings.micropost.content_max_length}
  validate :picture_size
  private

  def picture_size
    return unless picture.size > Settings.micropost.picture_max_size.megabytes
    errors.add :picture, I18n.t(".picture_size_message")
  end
end
