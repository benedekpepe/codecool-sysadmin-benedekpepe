# Cloud Blogger Bros

## Story

Your _bro_ is skeptical about the cloud so you figure it'd be best showing him that setting up a _cooool_ WordPress site isn't that complex at all!

## What are you going to learn?

- How to connect services securely running on different EC2 instances
- How to install and setup WordPress
- How to install and setup MySQL
- How to calculate the price for running services

## Tasks

1. Create a key pair for them team on AWS and use it to launch instances.
    - Created a key pair for the team to which all team members have access to
    - Used the team's _number_ in the key's name (e.g. `team-1codecool.com`)
    - The created key is used to launch all instances

2. Launch an EC2 instance, install the latest WordPress on it and make it available publicly.
    - Ubuntu Server 18.04 LTS image is used
    - Created a security group for the instance
    - Inbound public SSH traffic is allowed
    - Inbound public HTTP traffic is allowed
    - Configured DNS record to point to the instance's public IP (use the domain name when setting `WP_HOME` and `WP_SITE`)
    - Installed WordPress, visiting the public IP of the instance loads the website

3. Launch an EC2 instance, install MySQL on it and configure it so that WordPress could access it inside the private VPC/subnet.
    - Ubuntu Server 18.04 LTS image is used
    - Created a security group for the instance
    - Inbound public SSH traffic is allowed
    - **Inbound traffic on port 3306 is allowed only from the EC2 instance running WordPress** (and from nowhere else)
    - Installed MySQL, and configured so that it could be accessed remotely from another host (the EC2 instance running WordPress)

4. Calculate how much running these instances will cost for 30 days.
    - Created a calculation via the official AWS calculator

## General requirements

- Stopped instances while not in use to reduce costs
- **Terminated the instance** and deleted related resources after finishing the project
- Resources are created in `eu-central-1`
- `provision.sh` is not modified

## Hints

- **Watch out! The public IP of an EC2 instance might change if you stop and restart it**
- You can use `curl checkip.amazonaws.com` to check the public IP of an EC2 instance from inside the host
- MySQL uses port 3306 by default
- Most tutorials on installing WordPress usually install WordPress (with a webserver) and MySQL/MariaDB (as the database), but **remember, you need to install these on separate EC2 instances_
- WordPress uses MySQL or MariaDB as its database backend, you can use both, they're binary compatible
- When reading tutorials about MySQL remote connections **you can ignore `ufw` related information**
- When configuring inbound rules for a security group **you can specify _another_ security group by its ID as the source of the traffic, instead of an IP address**, this is _very_ powerful feature
- You can use Ubuntu's `mysql-server-5.7` and `mysql-client-5.7` packages to install the server and/or the client on host
- MySQL's configuration file on Ubuntu is located at `/etc/mysql/mysql.conf.d/mysqld.cnf`
- You can use the command-line MySQL client called `mysql` from the WordPress host to test DB connectivity
- Bonus points if you write scripts to automate the installation of these services :) Use scripts the `db.sh` and `wp.sh` scripts (run them on the remote hosts like `./provision.sh path/to/id_rsa <IP> db` or `wp` instead of `db`)
- Another bonus if you can limit the remote hosts clients can access MySQL from, e.g. with `CREATE USER ... 'user'@'192.168.0.0/255.255.0.0' ...` or similar (**watch out** the netmask can only be `/8`, `/16` or `/24`)
- As a simple extra point a DNS A record to your public WordPress node's IP
- As an extra configure your WordPress to use HTTPS instead of HTTP (use _Let's Encrypt_ if you decide to tackle this task)

## Background materials

- [Install WP/MySQL #1](https://linuxconfig.org/how-to-install-wordpress-on-ubuntu-18-04-bionic-beaver-linux)
- [Install WP/MySQL #2](https://ubuntu.com/tutorials/install-and-configure-wordpress#1-overview)
- [Install WP/MySQL #3](https://wordpress.org/support/article/how-to-install-wordpress/)
- [MySQL `CREATE USER`](https://dev.mysql.com/doc/refman/5.7/en/create-user.html)
- [MySQL remote connections](https://websiteforstudents.com/allow-remote-access-to-oracle-mysql-database-server-on-ubuntu-18-04/)
- [MySQL remote access](https://dev.mysql.com/doc/refman/5.7/en/account-names.html)
- [AWS Calculator](https://calculator.aws/)
- [CIDR calculator](http://sipcalc.tools.uebi.net/index.php)
