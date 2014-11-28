class Movie < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  has_many :reviews

  validates :title,
    presence: true

  validates :director,
    presence: true

  validates :runtime_in_minutes,
    numericality: { only_integer: true }

  validates :description,
    presence: true

  validates :image,
    presence: true

  validates :release_date,
    presence: true

  validate :release_date_is_in_the_future

  scope :search_title_or_director, ->(params) {where("title LIKE ? OR director LIKE ?", "%#{params[:title_or_director]}%", "%#{params[:title_or_director]}%")}
  # scope :search_title, ->(params) {where "title LIKE ?", "%#{params[:title]}%"}
  # scope :search_director, ->(params) {where "director LIKE ?", "%#{params[:director]}%"}
  scope :search_duration, ->(params) {where(runtime_in_minutes: (params[:duration].split("|").first.to_i)..(params[:duration].split("|").last.to_i))}

  def review_average  
    if reviews.size == 0
      reviews.sum(:rating_out_of_ten)/10
    else
     reviews.sum(:rating_out_of_ten)/reviews.size
   end
  end

  protected

  def release_date_is_in_the_future
    if release_date.present?
      errors.add(:release_date, "should probably be in the future") if release_date < Date.today
    end
  end

end
