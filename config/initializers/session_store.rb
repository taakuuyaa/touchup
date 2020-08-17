session_name = Rails.env.production? ? '_touchup_session' : "_touchup_#{Rails.env}_session"
Rails.application.config.session_store :cookie_store, key: session_name, expire_after: 24.hours, domain: Settings.session.domain, secure: Rails.env.production?
