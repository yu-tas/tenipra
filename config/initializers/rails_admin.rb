RailsAdmin.config do |config|
  config.asset_source = :webpacker

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
    redirect_to main_app.root_path unless current_user.admin?
  end
  config.current_user_method(&:current_user)

  ## == CancanCan ==
  config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new do
      only ['User', 'Menu'] do
        bindings[:view]._current_user.admin?
      end
    end
    export
    bulk_delete
    show
    edit do
      only ['User', 'Menu'] do
        bindings[:view]._current_user.admin?
      end
    end
    delete do
      only ['User', 'Menu'] do
        bindings[:view]._current_user.admin?
      end
    end
    show_in_app
  end
  
  config.model 'Menu' do
    edit do
      field :title
      field :description
      field :video, :active_storage
      field :difficulty_level
      field :practice_duration
      field :sets
      field :player_count
    end
  end
    ## With an audit adapter, you can add:
    # history_index
    # history_show
end
