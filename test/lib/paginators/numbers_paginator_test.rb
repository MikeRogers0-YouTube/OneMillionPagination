require 'test_helper'

class Paginators::NumbersPaginatorTest < ActiveSupport::TestCase
  def subject(per_page: nil, page: nil)
    Paginators::NumbersPaginator.new(per_page: per_page, page: page)
  end

  test 'Defaults showing numbers 1 to 1000' do
    assert_equal subject.length, 999, 'Has 999 numbers (1 to 1000)'
    assert_equal subject.first.value, 1, 'First number is 1'
    assert_equal subject.last.value, 1000, 'Last number is 1000'
  end

  test 'Passing :per_page adjusts amount of numbers per a page' do
    assert_equal subject(per_page: 25).length, 25, 'Has 25 numbers (1 to 26)'
    assert_equal subject(per_page: 25).first.value, 1, 'First number is 1'
    assert_equal subject(per_page: 25).last.value, 26, 'Last number is 26'

    assert_equal subject(per_page: 50).length, 50, 'Has 50 numbers (1 to 51)'
    assert_equal subject(per_page: 50).first.value, 1, 'First number is 1'
    assert_equal subject(per_page: 50).last.value, 51, 'Last number is 51'
  end

  test 'Passing :page adjusts the starting item value' do
    assert_equal subject(page: 1).first.value, 1, 'First number on page 1 is 1'
    assert_equal subject(page: 1).first.value, 1001, 'First number on page 2 is 1001'
  end

  test 'Passing a zero or negative :page value, disregards :page variable' do
    assert_equal subject(page: 0).first.value, 1, 'First number on page 1 is 1'
    assert_equal subject(page: -1).first.value, 1, 'First number on page 1 is 1'
  end

  test 'Passing a zero or negative :per_page value, disregards :per_page variable' do
    assert_equal subject(per_page: 0).length, 25, 'Has 25 numbers (1 to 26)'
    assert_equal subject(per_page: -1).length, 25, 'Has 25 numbers (1 to 26)'
  end
end
