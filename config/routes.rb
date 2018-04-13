Rails.application.routes.draw do

#-----------------------------------------------------------------

  root :to => 'status#new'

#-----------------------------------------------------------------

  resources :status do
    collection do
      get  :all_status
      get  :status_report
      post :notify_status
      get  :prev_status
    end
  end

  resources :utility  do
    collection do
      get  :risk_document
      get  :edit_risk_sheet
      post :create_risk_sheet
      put  :update_risk_sheet
    end
  end
#-----------------------------------------------------------------
# Custom Routes
#-----------------------------------------------------------------

  get '/all_status' => 'status#all_status'
  get '/sr' => 'status#status_report'
  get '/status/prev/:diff' => 'status#prev_status', :as => :previous_status

#-----------------------------------------------------------------

end
