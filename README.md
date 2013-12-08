puppet-sample
=============

Installation

1. install pupppet 
2. puppet module install biemond/jdk7
3. puppet module install puppetlabs/apt
4. puppet module install puppetlabs/mysql
5. puppet module install puppetlabs/mongodb
6. puppet module install erwbgy/jboss
7. mkdir -p /etc/puppet/modules/jdk7/files 
8. cd /etc/puppet/modules/jdk7/files
9. wget --no-cookies --header 'Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com' 'http://download.oracle.com/otn-pub/java/jdk/7u45-b18/jdk-7u45-linux-x64.tar.gz' --no-check-certificate
