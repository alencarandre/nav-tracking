# NAV TRACKING

- Clone this project
- Flow steps bellow to run (I recommend to use docker option)
- Be happy

## HOW TO RUN WITH DOCKER (RECOMMENDED)

### Installing docker and docker-compose
Be sure that docker and docker compose are installed in your computer,  if not, flow these tutorials (ubuntu based)

For `docker`
https://www.digitalocean.com/community/tutorials/como-instalar-e-usar-o-docker-no-ubuntu-16-04-pt

For `docker-compose`
https://www.digitalocean.com/community/tutorials/how-to-install-docker-compose-on-ubuntu-16-04

### Running

Inside root path project, run command `docker-compose up -d` and wait while pull and build images

After all load with success, you will have two url:

System http://localhost:3000
Page sample http://localhost:8000

### Stoping

Inside root path project, run command `docker-compose up -d` and wait to stop. If you not, the project will run forever

## HOW TO RUN WITHOUT DOCKER (NOT RECOMMENDED)

### Installing databases

Be sure that redis and postgres was installed on the machine, if not, install it

https://www.digitalocean.com/community/tutorials/como-instalar-e-utilizar-o-postgresql-no-ubuntu-16-04-pt

https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-redis-on-ubuntu-18-04

### Installing nodejs and yarn

Be sure if nodejs and yarn are installed on your machine, if not, flow below to install

**Add node repository**
```bash
curl -sL https://deb.nodesource.com/setup_9.x | sudo bash -
```

**Add yarn repository**
```bash
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
```

**Install**
```bash
sudo apt-get update && apt-get install -y nodejs yarn
```

### Prepare environment

Edit `hosts` file with `sudo`

```bash
sudo vim /etc/hosts
```

and add lines bellow on the end of file

```
127.0.0.1 postgres
127.0.0.1 rails
127.0.0.1 redis
```

Inside the directory nav-tracking-rails, on project path, execute commands below

```ruby
yarn install
rake webpacker::compile
```

### Prepare database

Inside the directory nav-tracking-rails, on project path, execute command below

```ruby
rake db:create db:schema:load
```

### Execute sidekiq

Inside the directory `nav-tracking-rails`, on project path, execute commands below

```bash
bundle exec sidekiq -d
```

### Write crontab

Inside the directory `nav-tracking-rails`, on project path, execute commands below

```bash
bundle exec whenever --update-crontab
```

### Run rails server

Inside the directory `nav-tracking-rails`, on project path, execute commands below

```bash
rails s
```
