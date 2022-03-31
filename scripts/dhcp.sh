#
echo -e "Instalando o ISC DHCP Server, aguarde..."
	# opção do comando: &>> (redirecionar a saída padrão)
	# opção do comando apt: -y (yes)
	apt -y install $DHCPINSTALL &>> $LOG
echo -e "ISC DHCP Server instalado com sucesso!!!, continuando com o script...\n"
sleep 5
#
#
echo -e "Atualizando os arquivos de configuração do ISC DHCP Server, aguarde..."
	# opção do comando: &>> (redirecionar a saída padrão)
	# opção do comando mv: -v (verbose)
	# opção do comando cp: -v (verbose)
	# opção do comando wget: -P (directory-prefix)
	mv -v /etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf.old &>> $LOG
	mv -v /etc/default/isc-dhcp-server /etc/default/isc-dhcp-server.old &>> $LOG
	cp -v conf/dhcp/dhcpd.conf /etc/dhcp/ &>> $LOG
	cp -v conf/dhcp/isc-dhcp-server /etc/default/ &>> $LOG
	wget $OUI -P /usr/local/etc/ &>> $LOG
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