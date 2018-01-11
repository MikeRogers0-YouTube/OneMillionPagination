class Paginators::NumbersPaginator
  include Enumerable
  extend Forwardable

  # Calling .each on this object, will call it on the private store method.
  def_delegators :store, :each, :first, :last, :size

  def initialize(per_page: 1000, page: 1)

    # Validate both elements can be positive integers, otherwise reset them to default
    per_page = 1000 if per_page.to_i <= 0
    page = 1 if page.to_i <= 0

    @per_page = per_page.to_i
    @page = page.to_i
  end

  def first_page?
    starting_number == 1
  end

  def last_page?
    ending_number == 1_000_000
  end

  def page
    @page
  end

  def next_page
    @page + 1
  end

  def previous_page
    @page - 1
  end

  private
  def store
    (starting_number..ending_number)
  end

  def starting_number
    number = ((@page - 1) * @per_page) + 1
    return number if number < 1_000_000
    1_000_000 - @per_page
  end

  def ending_number
    number = (@page * @per_page)
    return number if number <= 1_000_000
    1_000_000
  end
end
