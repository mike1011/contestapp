redis:       redis-server
sidekiq:     bundle exec sidekiq -q DelayedMailer,1 -q default
sidekiq_web: bundle exec thin -R sidekiq.ru start -p 9292
web:         bundle exec thin start