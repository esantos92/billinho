Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :students
    end
  end

  namespace 'api' do
    namespace 'v1' do
      resources :institutions
    end
  end

  namespace 'api' do
    namespace 'v1' do
      resources :enrollments
    end
  end

  namespace 'api' do
    namespace 'v1' do
      resources :bills
    end
  end
end
