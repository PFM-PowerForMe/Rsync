	
FROM	docker.io/library/alpine:edge	AS	runtime
RUN	apk add --no-cache \
	nushell \
	rsync
COPY	rootfs/rsync/rsyncd.conf	/etc/rsyncd.conf
COPY	rootfs/rsync/rsyncd.secrets	/etc/rsyncd.secrets
RUN	chmod 600 /etc/rsyncd.secrets
COPY	rootfs/entrypoint.nu	/usr/bin/entrypoint
COPY	rootfs/cron/rsync-client.nu	/etc/periodic/daily/rsync
RUN	chmod +x /usr/bin/entrypoint /etc/periodic/daily/rsync
ENTRYPOINT	["/usr/bin/entrypoint"]
