class Job < ApplicationRecord
  validates :title, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0}

  def publish!
    self.is_hidden = flase
    self.save
  end

  def hdie!
    self.is_hidden = true
    self.save
  end

  scope :published, ->{where(is_hidden: false)}
  scope :recent, -> {order("created_at DESC")}

  has_many :resumes
end
