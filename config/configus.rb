Configus.build Rails.env do
  env :production do

    carrierwave do
      storage :file
    end

    host 'colibrary.io'
    mailer do
      from "noreply@colibrary.io"
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
