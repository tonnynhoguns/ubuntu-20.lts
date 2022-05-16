#
echo -e "Instalando o ISC DHCP Server, aguarde..."
	# opção do comando: &>> (redirecionar a saída padrão)
	# opção do comando apt: -y (yes)
	apt install isc-dhcp-server
echo -e "ISC DHCP Server instalado com sucesso!!!, continuando com o script...\n"
sleep 5
echo -e "Adicionando o serviço para reiniciar com o sistema"
	systemctl enable isc-dhcp-server
#
#
echo -e "Atualizando os arquivos de configuração do ISC DHCP Server, aguarde..."
	# opção do comando: &>> (redirecionar a saída padrão)
	# opção do comando mv: -v (verbose)
	# opção do comando cp: -v (verbose)
	# opção do comando wget: -P (directory-prefix)
	mv -v /etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf.old
	mv -v /etc/default/isc-dhcp-server /etc/default/isc-dhcp-server.old
	cp -v conf/dhcp/dhcpd.conf /etc/dhcp/
	cp -v conf/dhcp/isc-dhcp-server /etc/default/
	wget $OUI -P /usr/local/etc/
echo -e "Arquivos atualizados com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Editando o arquivo de configuração dhcpd.conf, pressione <Enter> para continuar."
	# opção do comando: &>> (redirecionar a saída padrão)
	# opção do comando read: -s (Do not echo keystrokes)
	# opção do comando dhcpd: -t (test the configuration file)
	read -s
	vim /etc/dhcp/dhcpd.conf
	dhcpd -t &>> $LOG
echo -e "Arquivo editado com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Editando o arquivo de configuração isc-dhcp-server, pressione <Enter> para continuar."
	# opção do comando: &>> (redirecionar a saída padrão)
	# opção do comando read: -s (Do not echo keystrokes)
	# opção do comando dhcpd: -t (test the configuration file)
	read -s
	vim /etc/default/isc-dhcp-server
echo -e "Arquivo editado com sucesso!!!, continuando com o script...\n"
sleep 5
#