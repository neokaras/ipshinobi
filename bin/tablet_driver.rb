#!/opt/local/bin/ruby1.9

$:.unshift('../lib')
require 'ip_tablet'
require 'ip_tablet_store'

tablet1 = IpTablet.new('127.0.0.8/28')

tablet1.name = "ichi"

puts "network ip: #{tablet1.network_ip}"
puts "netmask: #{tablet1.netmask}"
#number_of_ips = tablet1.number_of_ips();
puts "the number of ips in this tablet is: #{tablet1.number_of_ips()}"
tablet1.display_tablet()

puts "#{$:}"

puts tablet1.inspect

puts "tablet name is #{tablet1.name}"
puts "tablet id is #{tablet1.id}"

store = IpTabletStore.new(tablet1)
store.store_tablet_as_xml()
