# frozen_string_literal: true
# == Schema Information
#
# Table name: look_book_images
#
#  id                      :integer          not null, primary key
#  alt_text                :string
#  look_book_id            :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  attachment_file_name    :string
#  attachment_content_type :string
#  attachment_file_size    :integer
#  attachment_updated_at   :datetime
#  position                :integer
#  attachment_width        :integer
#  attachment_height       :integer
#
# Indexes
#
#  index_look_book_images_on_look_book_id  (look_book_id)
#

module Spree
  class LookBookImage < Asset
    default_scope { order("#{self.table_name}.position") }

    belongs_to :look_book
    has_many :look_book_image_products, class_name: "Spree::LookBookImageProduct", dependent: :destroy
    has_many :spree_products, through: :look_book_image_products

    accepts_nested_attributes_for :look_book_image_products, allow_destroy: true

    before_save :find_dimensions, if: :attachment_updated_at_changed?

    has_attached_file :attachment, styles: { attachment: 'x200>' },
      default_style: :attachment, bucket: ENV['S3_BUCKET_NAME']

    validate :no_attachment_errors
    validates :alt_text, presence: true
    validates :attachment, attachment_presence: true,
    attachment_content_type: {
      content_type: ['image/jpg', 'image/jpeg']
    }

    def self.table_name
      'look_book_images'
    end

    def find_dimensions
      temporary = attachment.queued_for_write[:original]
      filename = temporary.path unless temporary.nil?
      filename = attachment.path if filename.blank?
      geometry = Paperclip::Geometry.from_file(filename)
      self.attachment_width  = geometry.width
      self.attachment_height = geometry.height
    end

    def mini_url
      attachment.url(:mini, false)
    end

    def no_attachment_errors
      unless attachment.errors.empty?
        errors.clear
        errors.add :attachment, "Paperclip returned errors for file '#{attachment_file_name}' - check ImageMagick installation or image source file."
        false
      end
    end
  end
end
