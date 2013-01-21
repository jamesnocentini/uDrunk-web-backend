class Measure < ActiveRecord::Base
  belongs_to :user
  attr_accessible :reading
end
