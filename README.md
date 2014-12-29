lifesense
=========
Ember app and Rails API for Senior Project
### Demo
A simple demo can be viewed [here](https://www.youtube.com/watch?v=5zoBDl7fs_0).
### Installation

#### Ubuntu 14.04
```bash
$ git clone git@github.com:amozoss/lifesense.git
$ cd lifesense
$ sudo apt-get install bundler ruby-dev libcurl3 libcurl3-gnutls libcurl4-openssl-dev libpq-dev libmysqlclient-dev libsqlite3-dev nodejs
$ bundle install
$ rake db:migrate
# seed the database with the default user:pwd of example-1@lifesense.com:password
$ rake db:seed
$ rails server
# You can now browse to http://localhost:3000 and login!
```
Note: Live updates will not work unless [lifesense-node](https://github.com/amozoss/lifesense-node) is running on localhost:4033 and [lifesense-pcb-software](https://github.com/amozoss/lifesense-pcb-software) is sending updates from the [pcb](https://github.com/amozoss/lifesense-pcb).

