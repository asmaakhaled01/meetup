class Event < ActiveRecord::Base
  belongs_to :group
has_many :comments
has_many :attendens
has_many :users, :through => :attendens
has_attached_file :ev_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png" 
validates_attachment_content_type :ev_image, :content_type => /\Aimage\/.*\Z/


validates :name, :ev_image , :desc ,:location , :date , presence: true
end
