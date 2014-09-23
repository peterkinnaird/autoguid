# Autoguid

This project rocks and uses MIT-LICENSE.

# Description
Autoguid lets you trivially add human readable uuids to all
your models, a whitelisted set of models, or all but a blacklisted set.
Indices are automatically created based on a configuration option.
There's also a rake task that will backfill these uuids into resources that
have already been created.

# Configuration
To get started, include the gem file, run ```bundle install```, then run
```rake autoguid:install```. Next edit the config/initializers/autoguid.rb
file to specify your configuration. Then migrate your tables with
```rake autoguid:migrate:up```. Next add the line ```include Autoguid``` to all the  models that will implement autoguids.
Run ```rake autoguid:migrate:backfill``` as required to backfill the existing rows in the database.
```rake autoguid:migrate:drop_all``` will drop all autoguid generated columns and
the data in them. 

# Additional Options 
You can always change the config/initializers/autoguid.rb file
and rerun ```rake autoguid:migrate:up``` to add autoguid to new models. **This process will delete all existing data, potentially breaking links in your application**