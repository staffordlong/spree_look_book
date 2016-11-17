# frozen_string_literal: true
module Spree
  module Admin
    class LookBookImageProductsController < ResourceController
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
    end
  end
end
