Rails.application.routes.draw do

  root 'importcsv#import'
  post 'database/update' => 'importcsv#update'

  get 'buildings' => 'buildings#index'
  get 'persons' => 'persons#index'

  get 'not_found' => 'static#not_found'
  get 'server_error' => 'static#server_error'
  get 'notification' => 'static#notification'

end
