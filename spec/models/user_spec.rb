require 'spec_helper'

describe User do
  describe "#has_mobile_number?" do
    specify "false when the user's number is blank" do
      subject.should_not have_mobile_number
    end

    specify "true when the user's number is set" do
      subject.mobile_number = "4085559292"
      subject.should have_mobile_number
    end
  end

end
