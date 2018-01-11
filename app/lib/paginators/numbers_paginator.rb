class Paginators::NumbersPaginator
  def initialize(per_page: nil, page: nil)
    @per_page = per_page || 1000
    @page = page || 1
  end
end
