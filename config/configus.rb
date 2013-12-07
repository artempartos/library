Configus.build Rails.env do
  env :production do

    carrierwave do
      storage :file
    end

    host 'colibrary.io'
    mailer do
      from "noreply@colibrary.io"
    end

    nexmo do
      key "3de86a98"
      secret "2c1131ff"
    end

  end

  env :development, parent: :production do

    carrierwave do
      storage :file
    end

    nexmo do
      key "test"
      secret "test"
    end

  end

  env :test, parent: :production do
  end

end
