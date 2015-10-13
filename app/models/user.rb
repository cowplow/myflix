class User < ActiveRecord::Base
  has_secure_password validations: false
  has_many :reviews
  has_many :queue_items, -> { order(:position)}

  validates :name, presence: true
  validates :password, presence: true, length: {minimum: 5}
  validates :email, presence: true, uniqueness: true

  def normalize_queue_positions
    queue_items.each_with_index do |queue_item, index|
      queue_item.update_attributes(position: index+1)
    end
  end

  def queued_video?(video)
    queue_items.map(&:video).include?(video)
  end
end