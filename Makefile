SHELL:=/bin/bash

export define script
ln -s /opt/publisher/publisher.service /usr/lib/systemd/system/publisher.service
systemctl daemon-reload
systemctl restart publisher
endef

build:
	echo -e "$$script" > post_install.sh
	fpm -s dir -t rpm -n publisher -v 1.0.0 \
			-x .git -x post_install.sh \
			-x .gitignore -x repo \
			-x Makefile --prefix /opt/publisher \
			--after-install $$PWD/post_install.sh \
			-a x86_64 \
			-C $$PWD
