class Comuna < ActiveRecord::Base
   belongs_to :provin
   has_many :users
end
