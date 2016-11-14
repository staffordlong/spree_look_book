# frozen_string_literal: true
RSpec.describe Spree::LookBook, regressor: true do
  it { is_expected.to have_many :look_book_images }
  it { is_expected.to accept_nested_attributes_for :look_book_images }
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :title }
  it { is_expected.to have_db_column :slug }
  it { is_expected.to have_db_column :active }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
end
