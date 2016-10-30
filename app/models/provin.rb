class Provin < ActiveRecord::Base
  belongs_to :region
  has_many :comunas
end
