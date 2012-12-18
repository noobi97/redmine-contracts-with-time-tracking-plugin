# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
#

match 'contracts/all'                                       => 'contracts#all',     :via => :get
match 'contracts'                                           => 'contracts#index',   :via => :get
match 'contracts/new'                                       => 'contracts#index',   :via => :get
match 'contracts/:id'                                       => 'contracts#destroy', :via => :delete
match 'contracts/:id/edit'                                  => 'contracts#edit',    :via => :get
match 'projects/:project_id/contracts'                      => 'contracts#index',   :via => :get
match 'projects/:project_id/contracts/new'                  => 'contracts#new',     :via => :get
match 'projects/:project_id/contracts/:id/edit'             => 'contracts#edit',    :via => :get
match 'projects/:project_id/contracts/:id'                  => 'contracts#show',    :via => :get
match 'projects/:project_id/contracts'                      => 'contracts#create',  :via => :post
match 'projects/:project_id/contracts/:id'                  => 'contracts#update',  :via => :put
match 'projects/:project_id/contracts/:id'                  => 'contracts#destroy', :via => :delete
match 'projects/:project_id/contracts/:id/add_time_entries' => 'contracts#add_time_entries', :via => :get
match 'projects/:project_id/contracts/:id/assoc_time_entries_with_contract' => 
        'contracts#assoc_time_entries_with_contract', 
        :via => :put


