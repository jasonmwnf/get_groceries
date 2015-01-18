class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :list

  validates :name, presence: true
  validates :user, :list, presence: true
end