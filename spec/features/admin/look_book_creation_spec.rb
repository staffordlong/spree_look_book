# frozen_string_literal: true
describe "Basic Look Book Spec", type: :feature do
  feature 'look book creation' do
    include_context "minimal setup"

    scenario 'clicking new look book returns correct look_book path' do
      given_i_am_on_the_look_book_view
      when_i_try_to_create_a_new_look_book
      then_i_should_be_on_the_look_book_creation_url
    end

    scenario 'creating a new look book' do
      given_i_am_on_the_new_look_book_view
      when_i_fill_in_the_required_fields
      then_i_should_be_on_the_look_book_edit_url
    end

    protected

    def given_i_am_on_the_look_book_view
      admin_login
      visit spree.admin_path
      click_link 'Look Book'
    end

    def given_i_am_on_the_new_look_book_view
      given_i_am_on_the_look_book_view
      when_i_try_to_create_a_new_look_book
    end

    def when_i_fill_in_the_required_fields
      fill_in 'Title', with: FFaker::HipsterIpsum.word
      fill_in 'Slug', with: FFaker::HipsterIpsum.word
      check 'Active'
      click_button 'Create'
    end

    def when_i_try_to_create_a_new_look_book
      click_link 'New Look Book'
    end

    def then_i_should_be_on_the_look_book_creation_url
      expect(current_path).to eql('/admin/look_books/new')
    end

    def then_i_should_be_on_the_look_book_edit_url
      expect(current_path).to eql('/admin/look_books/2/edit')
    end

    private

    def admin_login
      user = create(:admin, password: 'passpass')
      visit spree.admin_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'passpass'
      click_button 'Login'
    end
  end
end
