require 'test_helper'

class Paginators::NumbersPaginatorTest < ActiveSupport::TestCase
  def subject(per_page: nil, page: nil)
    Paginators::NumbersPaginator.new(per_page: per_page, page: page)
  end

  test 'Defaults showing numbers 1 to 1000' do
    assert_equal 1, subject.first, 'First number is 1'
    assert_equal 1000, subject.last, 'Last number is 1000'
    assert_equal 1000, subject.size, 'Has a total of 1000 numbers'
  end

  test 'Passing :per_page adjusts amount of numbers per a page' do
    assert_equal 1, subject(per_page: 25).first, 'First number is 1'
    assert_equal 25, subject(per_page: 25).last, 'Last number is 25'

    assert_equal 1, subject(per_page: 50).first, 'First number is 1'
    assert_equal 50, subject(per_page: 50).last, 'Last number is 50'
  end

  test 'Passing :page adjusts the starting item value' do
    assert_equal 1, subject(page: 1).first, 'First number on page 1 is 1'
    assert_equal 1000, subject(page: 1).last, 'Last number on page 1 is 1000'

    assert_equal 1001, subject(page: 2).first, 'First number on page 2 is 1001'
    assert_equal 2000, subject(page: 2).last, 'Last number on page 2 is 2000'

    assert_equal 2001, subject(page: 3).first, 'First number on page 3 is 2001'
    assert_equal 3000, subject(page: 3).last, 'Last number on page 3 is 3000'
  end

  test 'Passing a zero or negative :page value, disregards :page variable' do
    assert_equal 1, subject(page: 0).first, 'First number on page 1 is 1'
    assert_equal 1, subject(page: -1).first, 'First number on page 1 is 1'
  end

  test 'Passing a zero or negative :per_page value, disregards :per_page variable' do
    assert_equal 1000, subject(per_page: 0).last, 'Last number is 1000'
    assert_equal 1000, subject(per_page: -1).last, 'Last number is 1000'
  end

  test 'Highest value is 1,000,000' do
    # TODO
    #assert_equal 1_000_000, subject(per_page: 1_000_005).last, 'Last number is 1,000,000'
  end
end
