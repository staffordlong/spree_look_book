# frozen_string_literal: true
module Spree
  class LookBooksController < Spree::StoreController
    rescue_from ActiveRecord::RecordNotFound, with: :render_404

    def index
      @look_books = Spree::LookBook.active
      respond_with(@look_books)
    end

    def show
      @look_book = Spree::LookBook.active.find_by(slug: params[:slug]) or not_found
      respond_with(@look_book)
    end

    private

    def not_found
      raise ActionController::RoutingError.new(Spree.t(:lookbook_not_found))
    end
  end
end
