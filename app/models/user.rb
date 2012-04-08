class User
  include Mongoid::Document

  has_many :offers
  has_many :claims

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :trackable

  field :email, type: String, null: false, default: ""
  field :facebook_uid, type: String
  field :facebook_info, type: Hash

  field :mobile_number, type: String
  field :sendhub_contact_id, type: String

  ## Trackable
  field :sign_in_count, type: Integer, default: 0
  field :current_sign_in_at, typer: Time
  field :last_sign_in_at, type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip, type: String

  def has_mobile_number?
    !mobile_number.blank?
  end

  def claim offer
    claim = claims.create offer: offer
    Notification.new(claim).send!
  end

  def self.find_or_create_from_facebook auth_hash
    user = where(facebook_uid: auth_hash['uid']).first
    if user.nil?
      create email: auth_hash['info']['email'], facebook_uid: auth_hash['uid'],
        facebook_info: auth_hash
    else
      user
    end
  end
end

