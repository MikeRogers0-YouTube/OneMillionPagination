class NumbersController < ApplicationController
  def index
  end

  helper_method :resources
  def resources
    @resources ||= Paginators::NumbersPaginator.new(per_page: params[:per_page], page: params[:page])
  end
end
