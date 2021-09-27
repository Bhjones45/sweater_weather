class Api::V1::BookSearchController < ApplicationController
  def index
    books = BookSearchFacade.get_books(params[:location], params[:quantity])
    if params[:quantity].to_i <= 0
      render json: { error: "Quantity must be greater than 0" }, status: 400
    else
      render json: BookSearchSerializer.new(books), status: 200
  end
end
end
