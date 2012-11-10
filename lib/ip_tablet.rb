require 'ip'
require 'ip_utils'

class IpTablet
	attr_reader :network, :network_ip, :netmask, :id, :tablet_ips
	attr_accessor :name

	def initialize(network)
		@network = network
		@network_ip, @netmask = @network.split('/')
		@id = generate_id()
		self.create_tablet_ips()
	end

	def create_tablet_ips
		ip = @network_ip

		@tablet_ips = Array.new( number_of_ips() ) do
			ip_obj = Ip.new(ip, @id)
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

	def generate_id
		return 100;
	end
end
