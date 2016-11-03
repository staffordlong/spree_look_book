# frozen_string_literal: true
module Spree
  module LookBookHelper
    def find_product_by_id(product)
      Spree::Product.find_by(id: product.spree_product_id)
    end
  end
end
