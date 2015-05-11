class User < ActiveRecord::Base

has_many :members
has_many :groups, :through => :members

has_many :attendens
has_many :events, :through => :attendens

has_many :groups

has_many :comments

has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png" 
validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

validates :name, :image , presence: true
validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
validates :password, :presence => true,
                       :length => {:within => 6..40},
                       :on => :create

end
