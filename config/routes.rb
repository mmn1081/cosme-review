Rails.application.routes.draw do

  root to: "homes#top"

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :post_cosmes, only: [:index, :show, :destroy] do
      resources :comments, only: [:destroy]
    end

  end

  namespace :public do
    resources :post_cosmes, only: [:new, :index, :show, :edit, :create, :destroy, :update] do#親子関係にする為doend使用
      resources :comments, only: [:create, :destroy]
    end
    resources :customers, only: [:show, :edit, :update]

  end

  # 会員用
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  #ゲストログイン
  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  #For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
