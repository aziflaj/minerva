require 'yaml'

# create the DB if not yet created
db_config_file = File.join(File.dirname(__FILE__),'..', 'app', 'database.yml')
if File.exist?(db_config_file)
  config = YAML.load(File.read(db_config_file))
  DB = Sequel.connect(config)
  Sequel.extension :migration
end

# require lib/*.rb and app/**/*.rb
Dir[File.join(File.dirname(__FILE__), '..', 'lib', '*.rb')].each { |file| require file }
Dir[File.join(File.dirname(__FILE__), '..', 'app', '**', '*.rb')].each { |file| require file }

# Run all the migrations
if DB
  Sequel::Migrator.run(DB, File.join(File.dirname(__FILE__), '..', 'app', 'db', 'migrations'))
end

# Read the routes specified in the app/routes.yml file
ROUTES = YAML.load(File.read(File.join(File.dirname(__FILE__), '..', 'app', 'routes.yml')))
