class Question < ActiveRecord::Base
  belongs_to :user
  validates :content, :user_id, presence: true
  has_many :answers
end
