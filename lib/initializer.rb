require 'migrator'
require 'autoguid'

class Initializer

	def config
		@migrator = Migrator.new
		@migrator.config = Hash.new

    # To configure autoguid you need to edit this file. Uncomment ONE
    # of the following three lines based on your needs.

    # Uncomment this line to add autoguids to all of your models
		# @migrator.config[:all] = true

    # Uncomment this line to whitelist models that you want autoguids on
    # They will be added only to the resources listed
		# @migrator.config[:whitelist] = ['User','Office']

    # Uncomment this line to blacklist the models you dont want autoguids on
    # They will be added to all other models
		# @migrator.config[:blacklist] = ['User']

    # Uncomment this line to add indices to your autoguid generated columns
    # This will speed up lookups but occupy some database server memory
		# @migrator.config[:indices] = true
	end

	def up
		@migrator.up
	end

	def drop_all
		@migrator.down
	end

end
