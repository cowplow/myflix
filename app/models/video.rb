class Video < ActiveRecord::Base
  belongs_to :category
  has_many :reviews, -> { order "created_at DESC" }

  validates_presence_of :title, :description

  def self.search_by_title(title)
    return [] if title.blank?
    Video.where("title LIKE ?", "%#{title}%").order("created_at DESC")
  end
end