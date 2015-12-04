# $fuel_settings = parseyaml(file('/etc/compute.yaml'))
$pkg_version = "1.0"
if $operatingsystem == 'Ubuntu' {
        package { 'hello':
                ensure => "${pkg_version}",
        }
} elsif $operatingsystem == 'CentOS' {
	if $fuel_settings['fuel-plugin-ovs']['use_dpdk'] {
        	package { 'openvswitch':
                	ensure => "2.4.90-1.el6",
		}
        	package { 'kmod-openvswitch':
			ensure => "2.4.90-2.el6",
		}
        	package { 'dpdk':
                	ensure => "2.1.0-6.el6",
		}
        	package { 'dpdk-tools':
                	ensure => "2.1.0-6.el6",
		}
        	package { 'dpdk-devel':
                	ensure => "2.1.0-6.el6",
		}
        } else {
	        package { 'openvswitch':
	                ensure => "2.4.90-1",
	        }
        	package { 'kmod-openvswitch':
                	ensure => "2.4.90-1.el6",
		}
	}
}
