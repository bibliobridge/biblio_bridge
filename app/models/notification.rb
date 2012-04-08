class Notification
  def initialize claim
    @giver = claim.offer.user
    @book = claim.offer.book
    @taker = claim.user
    verify_user_is_sendhub_contact @giver
    verify_user_is_sendhub_contact @taker
  end

  def verify_user_is_sendhub_contact user
    if user.sendhub_contact_id
      return
    else
      sendhub = SendHub.create_contact user.first_name, user.mobile_number
      user.sendhub_contact_id = sendhub['id']
      user.save
    end
  end

  def tell_giver_book_is_claimed
    SendHub.send @giver.sendhub_contact_id, <<-TXT
Hey! #{@taker.first_name} wants to borrow your copy of #{@book.title}!
Call or text them at #{@taker.mobile_number}
    TXT
  end

  def tell_taker_giver_will_contact
    Sendhub.send @taker.sendhub_contact_id, <<-TXT
Hey! #{@giver.first_name} has a copy of #{@book.title}! They have your
number and should call soon!
    TXT
  end

  def send!
    tell_giver_book_is_claimed
    tell_taker_giver_will_contact
  end
end

