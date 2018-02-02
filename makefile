build:
	@echo "Building"
	cd scrapper && python3 setup.py build

install:
	@echo "Installing isen python package"
	cd scrapper && python3 setup.py install --record ../installed_files

	@echo "Installing systemd files"
	install -m 644 services/isen-plannings.service $(DESTDIR)/usr/lib/systemd/system/isen-plannings.service
	install -m 644 services/isen-plannings.timer $(DESTDIR)/usr/lib/systemd/system/isen-plannings.timer

remove:
	@echo "Removing systemd files"
	rm $(DESTDIR)/usr/lib/systemd/system/isen-plannings.timer
	rm $(DESTDIR)/usr/lib/systemd/system/isen-plannings.service

	@echo "Removing isen python package"
	cat scrapper/installed_files | xargs rm -rf

clean:
	-rm -rf scrapper/build
