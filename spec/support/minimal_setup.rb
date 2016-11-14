# frozen_string_literal: true
RSpec.configure do |rspec|
  rspec.shared_context_metadata_behavior = :apply_to_host_groups
end

RSpec.shared_context "minimal setup", shared_context: :metadata do
  def shared_method
    "it works"
  end

  let!(:store)            { create(:store, default_currency: "GBP") }
  let!(:country)          { create(:country, states_required: true) }
  let(:email)             { FFaker::Internet.email }
  let(:existing_user)     { create(:user, email: 'test@testerson.com') }
  let!(:look_book)        { create(:look_book) }
  let!(:payment_method)   { create(:check_payment_method) }
  let(:product)           { create(:aphid_product_with_variants) }
  let!(:state)            { create(:state, country: country) }
  let(:test_order)        { Spree::Order.last }
  let!(:zone)             { create(:zone) }
  let!(:taxon)            { create(:taxon) }
  let!(:stock_location)   { create(:stock_location) }
  let!(:shipping_method)  { create(:shipping_method, name: 'Derek McCourier', calculator: create(:shipping_calculator))  }
  let!(:promotion)        { create(:promotion, name: 'Free standard shipping') }
end

RSpec.configure do |rspec|
  rspec.include_context "minimal setup", include_shared: true
end
