## encoding: utf-8
#
###
## Backup Generated: backup
## Once configured, you can run the backup with the following command:
##
## $ backup perform -t backup [-c <path_to_configuration_file>]
##
#Backup::Model.new(:nastachku_staging, 'Nastachku staging backup') do
#
#  database PostgreSQL do |db|
#    db.name               = "nastachku_staging"
#    db.username           = "nastachku_staging"
#    db.password           = "a3matn6vEGvdq2jpr39A"
#  end
#
#  store_with Local do |local|
#    local.path = "/var/tmp/"
#    local.keep = 5
#  end
#
#  compress_with Gzip do |compression|
#    compression.best = true
#    compression.fast = false
#  end
#
#end
#
#Backup::Model.new(:nastachku_production, 'Nastachku production backup') do
#
#  database PostgreSQL do |db|
#    db.name               = "nastachku_production"
#    db.username           = "nastachku_production"
#    db.password           = "tKl4brOfdvg8xLndY7JPwV8s6pNhpn"
#  end
#
#  store_with Local do |local|
#    local.path = "/var/tmp/"
#    local.keep = 18
#  end
#
#  compress_with Gzip do |compression|
#    compression.best = true
#    compression.fast = false
#  end
#
#end