class Shoe < ActiveRecord::Base
    belongs_to :user
    belongs_to :buyer, class_name: "User"
    
    validates :name, :price, :user_id, presence: true
    validates_numericality_of :price, :greater_than => 0
end