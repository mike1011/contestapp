redis:       redis-server
sidekiq:     bundle exec sidekiq -C ./config/sidekiq.yml
sidekiq_web: bundle exec thin -R sidekiq.ru start -p 9292
