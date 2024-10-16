schedule_file = Rails.root.join("config/schedule.yml")

if schedule_file.exist? && Sidekiq.server?
  Rails.application.config.after_initialize do
    Sidekiq::Cron::Job.load_from_hash!(YAML.load(schedule_file.read))
  end
end

Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDIS_URL']  }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_URL'] }
end
