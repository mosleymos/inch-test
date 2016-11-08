Rails.application.routes.draw do
  root 'importcsv#import'
  post 'database/update' => 'importcsv#update'

  get 'buildings' => 'buildings#index'

  get 'persons' => 'persons#index'

end
