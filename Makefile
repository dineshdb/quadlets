traefik:
	make install app=$@

traefik-https: setup
	sudo touch /etc/containers/systemd/acme.json
	make install app=$@

syncthing:
	make install app=$@

seaweedfs:
	@make install app=$@

minio:
	@make install app=$@

vaultwarden:
	@make install app=$@

install:
	@sudo systemctl enable --now podman.socket
	@sudo cp -rf containers/${app}.* /etc/containers/systemd/
	@sudo systemctl daemon-reload
	@sudo systemctl restart ${app}
