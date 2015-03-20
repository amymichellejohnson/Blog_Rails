class Comment <ActiveRecord::Base
  belongs_to :post
  validates :comment, presence: :true
end
