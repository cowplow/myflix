class QueueItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :video

  delegate :category, to: :video
  delegate :title, to: :video, prefix: :video

  validates_numericality_of :position, {only_integer: true}


  def category_name
    category.name
  end

  def rating
    review.rating if review
  end

  def rating=(new_rating)
    if review
      #update_column will bypass validation, unlike update_attributes
      review.update_column(:rating, new_rating)
    else
      review = Review.new(user: user, video: video, rating: new_rating)
      #this will also bypass validations
      review.save(validate: false)
    end
  end

  private

  def review
    @review ||= Review.where(user_id: user.id, video_id: video.id).first
  end
end