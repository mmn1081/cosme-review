Rails.application.routes.draw do
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
  end
  root to: "homes#top"

  namespace :public do
    resources :post_cosmes, only: [:new, :index, :show, :edit, :create, :destroy, :update]
    resources :customers, only: [:show, :edit, :update]
  end

  # 会員用
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
