class Claim
  include Mongoid::Document

   belongs_to :user
   belongs_to :offer

end

