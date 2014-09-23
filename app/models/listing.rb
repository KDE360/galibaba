class Listing < ActiveRecord::Base
	has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.jpg"

	#validates
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	validates :name, :description, :price, presence: true
	validates :price, numericality: { greater_than: 0 }
  
  # if we want to make sure that a user MUST upload an image for every listing
  # validates_attachment_presence :image  

  belongs_to :user
  has_many :orders
end
