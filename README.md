# isen-aurion-grabber

Collection of tools and services to grab data from Aurion and use them in specific cases.

## Installation

```sh
git clone https://github.com/rodolpheh/isen-aurion-grabber
git submodules update --init --recursive
make
sudo make install
```

## Usage

For isen-planning, that uses GetAllPlannings.py (see details below), a configuration file can be found in `/etc/isen-planning.conf`. After that all you need is to start/enable the service:

```sh
# Start the timer
sudo systemctl start isen-plannings.timer
# Enable the timer on boot
sudo systemctl enable isen-plannings.timer
```

## Content

### systemd services

#### isen-plannings

Includes a service and a timer to fire that service regularly. The service use GetAllPlannings.py from Scrapper (see the submodules) to retrieve all the plannings. The timer fires the service 15 minutes after boot and regularly every 24 hours.

### Submodules

#### Scrapper

A Python package that implements login and scrapping of data from Aurion. Also adds programs using the package to retrieve and save data.
