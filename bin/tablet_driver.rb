#!/opt/local/bin/ruby1.9

$:.unshift('../lib')
require 'ip_tablet'

tablet1 = IpTablet.new('127.0.0.8/28')

puts "network ip: #{tablet1.network_ip}"
puts "netmask: #{tablet1.netmask}"
#number_of_ips = tablet1.number_of_ips();
puts "the number of ips in this tablet is: #{tablet1.number_of_ips()}"
tablet1.display_tablet()

puts "#{$:}"
