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

  private
  def store
    (starting_number..ending_number)
  end

  def starting_number
    ((@page - 1) * @per_page) + 1
  end

  def ending_number
    (@page * @per_page)
  end
end
