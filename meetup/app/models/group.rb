class Group < ActiveRecord::Base

has_many :events
has_many :interests
has_many :members
has_many :users, :through => :members
geocoded_by :name, :latitude => :lat , :longitude => :lang

belongs_to :user

has_attached_file :g_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png" 
validates_attachment_content_type :g_image, :content_type => /\Aimage\/.*\Z/


end
