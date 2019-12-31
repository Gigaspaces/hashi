log_level = "DEBUG"
data_dir="/etc/consul"
bind_addr = "{{ GetPrivateInterfaces | include \"network\" \"172.31.0.0/20\" | attr \"address\" }}"
addresses {
   dns = "{{ GetPrivateInterfaces | include \"network\" \"172.31.0.0/20\" | attr \"address\" }}"
}
ports {
   dns = 53
}