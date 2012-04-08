class Offer
  include Mongoid::Document

  belongs_to :user
  belongs_to :book
end

