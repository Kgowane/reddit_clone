Rails.application.routes.draw do
  devise_for :users, controllers: {
          registrations: 'users/registrations'
   }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root to: 'posts#index'

 resources :users
 resources :posts do
   resources :comments do
     collection do
       post '/:id/upvote_comment', to: 'comments#upvote_comment', as: 'upvote'
       post '/:id/downvote_comment', to: 'comments#downvote_comment', as: 'downvote'
     end
   end
   collection do
     post '/:id/upvote_post', to: 'posts#upvote_post', as: 'upvote'
     post '/:id/downvote_post', to: 'posts#downvote_post', as: 'downvote'
   end
 end



end
