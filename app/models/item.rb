class Item < ActiveRecord::Base
  belongs_to :todolist

  validates :content, presence: true
  validates :content, length: { minimum: 2 }
end
