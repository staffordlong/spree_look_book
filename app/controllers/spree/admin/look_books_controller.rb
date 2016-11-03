# frozen_string_literal: true
module Spree
  module Admin
    class LookBooksController < ResourceController
      before_action :assign_look_book, only: %i(edit update destroy)

      respond_to :html

      rescue_from ActiveRecord::RecordNotFound, with: :render_404

      def index
        @look_books = LookBook.all
      end

      def new
        @look_book = LookBook.new
      end

      def create
        @look_book = LookBook.new(look_book_params)
        if @look_book.valid?
          @look_book.save
          flash[:success] = "Look Book successfully created"
          redirect_to edit_admin_look_book_path(@look_book)
        else
          flash[:error] = "Something went wrong"
          render action: :new
        end
      end

      def edit
      end

      def update
        if @look_book.update(look_book_params)
          @look_book.save
          flash[:success] = "Look book successfully updated"
          redirect_to edit_admin_look_book_path(@look_book)
        else
          flash[:error] = "Something went wrong"
          render action: :edit
        end
      end

      def destroy
        title = @look_book.title
        if @look_book.destroy
          flash[:success] = "\"#{title}\" was deleted successfully"
          redirect_to action: :index
        else
          flash[:error] = 'There was an error deleting the look book. Please try again'
          redirect_to action: :index
        end
      end

      private

      def assign_look_book
        @look_book = LookBook.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        flash[:alert] = "The look book you were looking for could not be found."
      end

      def look_book_params
        params.require(:look_book).permit(:title, :slug, :active)
      end
    end
  end
end
