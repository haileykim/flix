class Movie < ActiveRecord::Base

  has_attached_file :image

  validates :title, :released_on, :duration, presence: true
  validates :description, length: { minimum: 5 }
  validates :total_gross, numericality: { greater_than_or_equal_to: 0 }
  validates_attachment :image, 
  :content_type => { :content_type => ['image/jpeg', 'image.png'] },
  :size => { :less_than => 5.megabyte }

  
  RATINGS = %w(G PG PG-13 R NC-17)
  validates :rating, inclusion: { in: RATINGS }

  has_many :reviews, dependent: :destroy

  def flop?
  	total_gross.blank? || total_gross < 50000000
  end

  def self.released
  	where("released_on <= ?", Time.now).order(released_on: :desc)
  end  

  def average_stars
    reviews.average(:stars)
  end

end
