#
echo -e "Atualizando as listas do Apt, aguarde..."
	#opção do comando: &>> (redirecionar a saída padrão)
	apt update
echo -e "Listas atualizadas com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Atualizando todo o sistema operacional, aguarde..."
	
	# opção do comando apt: -y (yes)
	apt -y upgrade
	apt -y dist-upgrade
	apt -y full-upgrade
echo -e "Sistema atualizado com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Removendo todos os software desnecessários, aguarde..."
	
	# opção do comando apt: -y (yes)
	apt -y autoremove
	apt -y autoclean
echo -e "Software removidos com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Iniciando a Instalação e Configuração do Bind9 DNS Server, aguarde...\n"
sleep 5
#
echo -e "Instalando o Bind9 DNS Server, aguarde..."
	
	# opção do comando apt: -y (yes)
	apt -y install $DNSINSTALL
echo -e "Bind9 DNS Server instalado com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Verificando o serviço do Bind DNS Server, aguarde..."
	echo -e "Bind DNS: $(systemctl status bind9 | grep Active)"
echo -e "Serviço verificado com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Atualizando os arquivos de configuração do Bind DNS Server, aguarde..."
	# opção do comando: &>> (redirecionar a saída padrão)
	# opção do comando mkdir: -v (verbose)
	# opção do comando mv: -v (verbose)
	# opção do comando cp: -v (verbose)
	# opção do bloco e agrupamentos {}: (Agrupa comandos em um bloco)
	# opção do comando chown: -R (recursive), -v (verbose), root (user), bind (user), bind (group)
	mkdir -v /var/log/named/ 
	chown -Rv bind:bind /var/log/named/ 
	mv -v /etc/bind/named.conf /etc/bind/named.conf.old 
	mv -v /etc/bind/named.conf.local /etc/bind/named.conf.local.old 
	mv -v /etc/bind/named.conf.options /etc/bind/named.conf.options.old 
	mv -v /etc/bind/named.conf.default-zones /etc/bind/named.conf.default-zones.old 
	mv -v /etc/bind/rndc.key /etc/bind/rndc.key.old 
	mv -v /etc/default/named /etc/default/named.old 
	cp -v conf/dns/{named.conf,named.conf.local,named.conf.options,named.conf.default-zones,rndc.key} /etc/bind/ 
	cp -v conf/dns/{example.com.hosts,192.168.56.rev} /var/lib/bind/ 
	cp -v conf/dns/{dnsupdate-cron,rndcupdate-cron} /etc/cron.d/ 
	cp -v conf/dns/named /etc/default/ 
	cp -v conf/dns/rndcstats /etc/logrotate.d/ 
	chown -v root:bind /etc/bind/rndc.key 
	chown -v root:bind /var/lib/bind/{example.com.hosts,192.168.56.rev} 
echo -e "Arquivos atualizados com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Editando o arquivo de configuração named.conf, pressione <Enter> para continuar."
	# opção do comando read: -s (Do not echo keystrokes)
	read -s
	vim /etc/bind/named.conf
echo -e "Arquivo editado com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Editando o arquivo de configuração named.conf.local, pressione <Enter> para continuar."
	# opção do comando read: -s (Do not echo keystrokes)
	read -s
	vim /etc/bind/named.conf.local
echo -e "Arquivo editado com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Editando o arquivo de configuração named.conf.options, pressione <Enter> para continuar."
	# opção do comando: &>> (redirecionar a saída padrão)
	# opção do comando read: -s (Do not echo keystrokes)
	read -s
	vim /etc/bind/named.conf.options
	named-checkconf
echo -e "Arquivo editado com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Editando o arquivo de configuração named.conf.default-zones, pressione <Enter> para continuar."
	# opção do comando: &>> (redirecionar a saída padrão)
	# opção do comando read: -s (Do not echo keystrokes)
	read -s
	vim /etc/bind/named.conf.default-zones
echo -e "Arquivo editado com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Editando o arquivo de configuração rndc.key, pressione <Enter> para continuar."
	# opção do comando read: -s (Do not echo keystrokes)
	read -s
	vim /etc/bind/rndc.key
echo -e "Arquivo editado com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Editando o arquivo de configuração example.com.hosts, pressione <Enter> para continuar."
	# opção do comando: &>> (redirecionar a saída padrão)
	# opção do comando read: -s (Do not echo keystrokes)
	read -s
	vim /var/lib/bind/example.com.hosts
	named-checkzone $DOMAIN /var/lib/bind/example.com.hosts
echo -e "Arquivo editado com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Editando o arquivo de configuração 192.168.56.rev, pressione <Enter> para continuar."
	# opção do comando: &>> (redirecionar a saída padrão)
	# opção do comando read: -s (Do not echo keystrokes)
	read -s
	vim /var/lib/bind/192.168.56.rev
	named-checkzone $DOMAINREV /var/lib/bind/192.168.56.rev
	named-checkzone $NETWORK /var/lib/bind/192.168.56.rev
echo -e "Arquivo editado com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Editando o arquivo de configuração named, pressione <Enter> para continuar."
	# opção do comando read: -s (Do not echo keystrokes)
	read -s
	vim /etc/default/named
echo -e "Arquivo editado com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Editando o arquivo de configuração dnsupdate-cron, pressione <Enter> para continuar."
	# opção do comando read: -s (Do not echo keystrokes)
	read -s
	vim /etc/cron.d/dnsupdate-cron
echo -e "Arquivo editado com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Editando o arquivo de configuração rndcupdate-cron, pressione <Enter> para continuar."
	# opção do comando read: -s (Do not echo keystrokes)
	read -s
	vim /etc/cron.d/rndcupdate-cron
echo -e "Arquivo editado com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Editando o arquivo de configuração rndcstats, pressione <Enter> para continuar."
	# opção do comando: &>> (redirecionar a saída padrão)
	# opção do comando read: -s (Do not echo keystrokes)
	# opção do comando logrotate: -d (debug)
	read -s
	vim /etc/logrotate.d/rndcstats
	logrotate /etc/logrotate.d/rndcstats -d
echo -e "Arquivo editado com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Inicializando os serviços do Netplan e do Bind DNS Server, aguarde..."
	# opção do comando: &>> (redirecionar a saída padrão)
	netplan --debug apply
	systemctl restart bind9
	systemctl reload bind9
	rndc sync -clean
	rndc stats
echo -e "Serviços inicializados com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Verificando o serviço do Bind DNS Server, aguarde..."
	echo -e "Bind DNS: $(systemctl status bind9 | grep Active)"
echo -e "Serviço verificado com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Verificando as portas de conexões do Bind DNS Server, aguarde..."
	# opção do comando lsof: -n (inhibits the conversion of network numbers to host names for 
	# network files), -P (inhibits the conversion of port numbers to port names for network files), 
	# -i (selects the listing of files any of whose Internet address matches the address specified 
	# in i), -s (alone directs lsof to display file size at all times)
	lsof -nP -iUDP:53
	echo -e "============================================================="
	lsof -nP -iTCP:53 -sTCP:LISTEN
	echo -e "============================================================="
	lsof -nP -iTCP:953 -sTCP:LISTEN
echo -e "Portas verificadas com sucesso!!!, continuando com o script...\n"
sleep 5
#