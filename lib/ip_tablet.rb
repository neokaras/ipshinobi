require 'ip'
require 'ip_utils'

class IpTablet
	attr_reader :network, :network_ip, :netmask

	def initialize(network)
		@network = network
		@network_ip, @netmask = @network.split('/')
		self.create_tablet_ips()
	end

	def create_tablet_ips
		i = 0
		ip = @network_ip

		@tablet_ips = Array.new( self.number_of_ips() ) do
			ip_obj = Ip.new(ip)
			ip = IpUtils.next_ip(ip)
			ip_obj
		end
	end

	def number_of_ips
		number_of_ips = 2**(32 - @netmask.to_i)
	end
	
	def display_tablet
		for ip in @tablet_ips do
			puts "ip:#{ip.ip}\ttag:#{ip.tag}"
		end
	end
end
