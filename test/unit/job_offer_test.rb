require 'test_helper'

class JobOfferTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert JobOffer.new.valid?
  end
end
