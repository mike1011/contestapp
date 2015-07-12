class Shop < ActiveRecord::Base

  validates_presence_of :domain,:email
  belongs_to :account
end
