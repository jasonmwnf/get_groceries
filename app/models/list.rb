class List < ActiveRecord::Base
  has_many :items
  belongs_to :user

  validates :user, :title, presence: true
end