# frozen_string_literal: true
module Spree
  class LookBooksController < Spree::StoreController
    rescue_from ActiveRecord::RecordNotFound, with: :render_404

    def index
      @look_books = Spree::LookBook.active
      respond_with(@lookbooks)
    end

    def show
      @look_book = Spree::LookBook.find_by!(slug: params[:slug])
      respond_with(@lookbook)
    end
  end
end
