#! /usr/bin/env ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

source = 'hosts.yml'

if ARGV.length != 0
  source = ARGV[0]
end

require 'yaml'
hosts = YAML.load_file(source)

hosts.each do |host|
  puts "%s %s %s" % [host["network"]["eth1"]["ip"], host["name"], host["name"]]
end

