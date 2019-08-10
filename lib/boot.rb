require 'yaml'

# create the DB if not yet created
db_config_file = File.join(File.dirname(__FILE__), '..', 'config', 'database.yml')
if File.exist?(db_config_file)
  DB =
    if ENV['RACK_ENV'] == 'production'
      Sequel.connect(ENV['DATABASE_URL'])
    else
      config = YAML.safe_load(File.read(db_config_file))
      Sequel.connect(config['development'])
    end
  Sequel.extension :migration
end

# Run all the migrations
Sequel::Migrator.run(DB, File.join(File.dirname(__FILE__), '..', 'db', 'migrations')) if DB

# require lib/*.rb and app/**/*.rb
Dir[File.join(File.dirname(__FILE__), '*.rb')].each(&method(:require))
Dir[File.join(File.dirname(__FILE__), '..', 'app', '**', '*.rb')].each(&method(:require))

# Read the routes specified in the app/routes.yml file
ROUTES = YAML.safe_load(File.read(File.join(File.dirname(__FILE__), '..', 'config', 'routes.yml')))
