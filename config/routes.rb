Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :alunos
    end
  end

  namespace 'api' do
    namespace 'v1' do
      resources :ies
    end
  end
end
