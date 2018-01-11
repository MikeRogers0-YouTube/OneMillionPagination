require 'test_helper'

class IntegerTest < ActiveSupport::TestCase
  # I've monkey patched the Integer class to add the `to_words` method.
  test '.to_words' do
    assert_equal 'one', 1.to_words
    assert_equal 'five', 5.to_words
    assert_equal 'eleven', 11.to_words
    assert_equal 'twenty', 20.to_words
    assert_equal 'twenty-six', 26.to_words
    assert_equal 'eight hundred and fifty-one', 852.to_words
    assert_equal 'one thousand and fifty', 1050.to_words
    assert_equal 'one thousand and fifty', 1050.to_words
    assert_equal 'four hundred and ninety thousand, one hundred and twenty', 490_120.to_words
    assert_equal 'five hundred thousand', 500_000.to_words
    assert_equal 'nine hundred and ninety-nine thousand, nine hundred and ninety-nine', 999_999.to_words
    assert_equal 'one million', 1_000_000.to_words
  end
end

