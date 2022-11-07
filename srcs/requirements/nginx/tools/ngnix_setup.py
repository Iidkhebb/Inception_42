import os
import os.path

if (not os.path.isfile('/etc/ssl/certs/nginx.crt')):
	print('Generating nginx certificate')
	
	os.system('openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout \
	/etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj \
	"/C=MA/ST=Beni Mellal-Khenifra/L=Khouribga/O=42/OU=42/CN=iidkhebb.42.fr"')

	print('SSL Done !')
