Rails.application.routes.draw do
  root :to => 'status#new'
  resources :status do
    collection do
      get :all_status
      get :status_report
      get :notify_status
    end
  end

  get '/all_status' => 'status#all_status'
end
