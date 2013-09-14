Configus.build Rails.env do
  env :production do

    carrierwave do
      storage :file
    end

    host 'colibrary.ru'
    mailer do
      from "noreply@colibrary.ru"
    end

  end

  env :development, parent: :production do

    carrierwave do
      storage :file
    end

  end

  env :test, parent: :production do
  end

end