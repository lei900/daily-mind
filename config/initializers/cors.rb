Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "http://localhost:3000",
            "http://127.0.0.1:3000",
            "\Ahttps:\/\/daily-mind-\S*\.vercel\.app\/\S*"

    resource "/api/v1/*",
             headers: :any,
             methods: %i[get post put patch delete options head]
  end
end
