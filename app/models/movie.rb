class Movie < ActiveRecord::Base

  has_many :reviews

  validates :title,
    presence: true

  validates :director,
    presence: true

  validates :runtime_in_minutes,
    numericality: { only_integer: true }

  validates :description,
    presence: true

  # validates :poster_image_url,
  #   presence: true

  validates :release_date,
    presence: true

  validate :release_date_is_in_the_future

  mount_uploader :image, ImageUploader

  scope :title_search, -> (title="") { where("title LIKE ?", "%#{title}%") if !title.blank? }

  scope :director_search, -> (director="") { where("director LIKE ?", "%#{director}%")}

  scope :duration_under90_search, -> { where("runtime_in_minutes < 90") }

  scope :duration_between_90_and_120_search, -> { where("runtime_in_minutes >= 90 AND runtime_in_minutes <= 120") }

  scope :duration_over120_search, -> { where("runtime_in_minutes > 120") }


  # def self.duration_select(search_terms)
  #   if search_terms[:less_than].present
  #     duration_less_than(search_terms[:less_than])
  #   elsif ...

  #   end
  # end

  def review_average
    reviews.sum(:rating_out_of_ten)/reviews.size if reviews.size > 0 || !reviews.size
  end
  
  protected

  def release_date_is_in_the_future
    if release_date.present?
      errors.add(:release_date, "should probably be in the future") if release_date < Date.today
    end
  end

end


Movie.title_search.director_search