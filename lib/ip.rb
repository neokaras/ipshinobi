class Ip
	attr_reader :ip, :tablet_id
	attr_accessor :tag, :ip_attr

	def initialize(ip, tablet_id)
		@ip = ip
		@tablet_id = tablet_id
		ip_attr_init()
	end

	def ip_attr_init
		@ip_attr = { hostname: nil, domain: nil }
	end
end
