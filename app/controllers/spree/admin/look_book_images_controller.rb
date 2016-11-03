# frozen_string_literal: true
module Spree
  module Admin
    class LookBookImagesController < ResourceController
      before_action :set_look_book
      before_action :set_look_book_image, only: %i(edit update destroy)

      respond_to :html

      def index
        @look_book_images = @look_book.look_book_images.all
      end

      def new
        @look_book_image = @look_book.look_book_images.build
        @look_book_image.look_book_image_products.build
      end

      def edit; end

      def create
        @look_book_image = @look_book.look_book_images.build(look_book_image_params)

        if @look_book_image.save
          flash[:success] = "Image has been created."
          redirect_to admin_look_book_look_book_images_path
        else
          flash[:alert] = "Image not created successfully"
          render action: :new
        end
      end

      def destroy
        if @look_book_image.destroy
          flash[:success] = "Look Book Image was deleted successfully"
        else
          flash[:error] = 'There was an error deleting the look book image. Please try again'
        end

        respond_with(@look_book_image) do |format|
          format.html { redirect_to admin_look_book_look_book_images_path(@look_book) }
          format.js   { render_js_for_destroy }
        end
      end

      def update
        if @look_book_image.update(look_book_image_params)
          @look_book_image.save
          flash[:success] = "Look book image successfully updated"
          redirect_to edit_admin_look_book_look_book_image_path
        else
          flash[:error] = "Something went wrong"
          render action: :edit
        end
      end

      def update_positions
        ActiveRecord::Base.transaction do
          params[:positions].each do |id, index|
            model_class.find(id).set_list_position(index)
          end
        end

        respond_to do |format|
          format.js { render text: 'Ok' }
        end
      end

      private

      def set_look_book_image
        @look_book_image = @look_book.look_book_images.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        flash[:alert] = "The image you were looking for could not be found."
      end

      def set_look_book
        @look_book = LookBook.find(params[:look_book_id])
      end

      def look_book_image_params
        params.require(:look_book_image).permit(:alt_text, :attachment, :look_book_id, :position,
                                                look_book_image_products_attributes: %i(id look_book_image_id position spree_product_id _destroy))
      end
    end
  end
end
