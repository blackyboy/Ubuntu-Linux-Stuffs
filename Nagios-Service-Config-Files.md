#### Nagios Service Config file.


```

define host {
        use                   	        generic-host
        host_name              	        devWebSrv
        alias                   	devWebSrv
        address                 	192.168.1.55
        }

define service{
        use                     	generic-service		; Name of service template to use
        host_name               	devWebSrv
        service_description     	HTTP-Server
        check_command           	check_http
}

define service{
        use                             generic-service         ; Name of service template to use
        host_name                       devWebSrv
        service_description             Disk Space
        check_command                   check_all_disks!20%!10%
}

define service{
        use                             generic-service         ; Name of service template to use
        host_name                       devWebSrv
        service_description             Current Users
        check_command                   check_users!20!50
}

define service{
        use                             generic-service         ; Name of service template to use
        host_name                       devWebSrv
        service_description             Total Processes
        check_command                   check_procs!250!400
}

define service {
        use                             generic-service		; Name of service template to use
        host_name                       devWebSrv
        service_description             PING
        check_command                   check_ping!100.0,20%!500.0,60%
        }

define service {
        use                             generic-service		; Name of service template to use
        host_name                       devWebSrv
        service_description             SSH
        check_command                   check_ssh
        notifications_enabled           0
        }
define service{
        use                             generic-service         ; Name of service template to use
        host_name                       devWebSrv
        service_description             Current Load
        check_command                   check_load!5.0!4.0!3.0!10.0!6.0!4.0
}

```

