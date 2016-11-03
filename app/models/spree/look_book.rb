# frozen_string_literal: true
# == Schema Information
#
# Table name: look_books
#
#  id         :integer          not null, primary key
#  title      :string
#  slug       :string
#  active     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

module Spree
  class LookBook < Spree::Base
    before_validation :set_slug

    validates :title, presence: true, strict: true
    validates :slug, uniqueness: true

    has_many :look_book_images
    before_destroy { clear_look_book_images }

    scope :active, -> { where(active: true) }

    accepts_nested_attributes_for :look_book_images, allow_destroy: true

    def set_slug
      self.slug = title.to_url if slug.blank?
    end

    def self.table_name
      'look_books'
    end

    def is_active?
      active ? "✔" : "x"
    end

    def clear_look_book_images
      if look_book_images
        look_book_images.clear
      end
    end

    def has_images?
      look_book_images.any?
    end
  end
end
