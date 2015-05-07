class User < ActiveRecord::Base

has_many :members
has_many :groups, :through => :members

has_many :attendens
has_many :events, :through => :attendens

has_many :groups

has_many :comments

has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png" 
validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


end
