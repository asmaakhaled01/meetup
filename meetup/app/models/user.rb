class User < ActiveRecord::Base
has_many :members
has_many :groups, :through => :members

has_many :attendens
has_many :events, :through => :attendens

has_many :groups

has_many :comments

end
