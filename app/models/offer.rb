class Offer
  include Mongoid::Document

  belongs_to :user
  belongs_to :book
  has_one :claim
end

