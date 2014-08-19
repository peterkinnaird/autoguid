require 'migrator'
require 'autoguid'

class Initializer

	def config
		@migrator = Migrator.new
		@migrator.config = Hash.new
		# @migrator.config[:all] = true
		# @migrator.config[:whitelist] = ['User','Office']
		@migrator.config[:blacklist] = ['User']
		@migrator.config[:indices] = true
	end

	def up
		@migrator.up
	end

	def drop_all
		@migrator.down
	end

end
