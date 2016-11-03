# frozen_string_literal: true
# == Schema Information
#
# Table name: look_book_image_products
#
#  id                 :integer          not null, primary key
#  look_book_image_id :integer
#  spree_product_id   :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  position           :integer
#
# Indexes
#
#  index_look_book_image_products_on_look_book_image_id  (look_book_image_id)
#  index_look_book_image_products_on_spree_product_id    (spree_product_id)
#
# Foreign Keys
#
#  fk_rails_a3c086746c  (look_book_image_id => look_book_images.id)
#  fk_rails_d80567fe24  (spree_product_id => spree_products.id)
#

module Spree
  class LookBookImageProduct < ActiveRecord::Base
    def self.table_name
      'look_book_image_products'
    end

    acts_as_list scope: :look_book_image

    belongs_to :look_book_image
    belongs_to :spree_product, class_name: 'Spree::Product'

    delegate :name, :short_description, :slug, to: :spree_product
  end
end
