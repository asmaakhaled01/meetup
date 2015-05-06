class Group < ActiveRecord::Base

has_many :events
has_many :interests
has_many :members
has_many :users, :through => :members

belongs_to :user
end
