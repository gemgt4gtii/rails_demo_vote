Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :candidates do
    #  自定義路徑
    # member/collectio do
    #   post/get(方法) :名稱
    # end

    member do
      post :vote
    end
  end
end
