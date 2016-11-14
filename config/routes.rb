Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :look_books do
      resources :look_book_images, only: %i(index create destroy new edit update) do
        post :update_positions, on: :collection
        resources :look_book_image_products do
          collection do
            post :update_positions
          end
        end
      end
    end

  scope 'look-books' do
    get '/:slug', to: 'look_books#show',  as: :look_book
  end
end