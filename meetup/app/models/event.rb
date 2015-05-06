class Event < ActiveRecord::Base
  belongs_to :group
has_many :comments
has_many :attendens
has_many :users, :through => :attendens

end
