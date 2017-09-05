# friendly-backup
Simple shell script to backup your websites, databases and maybe more...

## Installation

Just `git clone` the repo on your server.

## Configuration

Setup variables between __BEGIN Configuration__ and __END Configuration__.

### Backups retention

```shell
# Number of days to retain backups (default: 10 days)
date=$(date +%Y%m%d)
deldate=`date --date '10 days ago' "+%Y%m%d"`
```
> Change *10 days ago* by whatever you want

### Directories setup

__Source directory where your websites are:__  
```shell
# Source directory
sourcedir="/my/source/directory"
```

-----

__Destination directory where your backups will be saved:__ 
```shell
# Destination direcrtory (backups directory)
destdir="/my/destination/directory"
```

-----

__List up the websites directories you want to backup:__
```shell
# Websites (separated by spaces)
sites='website1 website2 website3'
```

### Databases setup

#### !!! CAUTION: Only MySQL is supported for the moment !!!

__Your MySQL host (default: localhost):__
```shell 
# Database host
db_host='localhost'
```

-----

__Your MySQL user:__  
```shell
# Database user
db_user='my_db_user'
```

-----

__Your MySQL password:__  
```shell
# Database password
db_password='my_db_password'
```

## Usage

1) `chmod u+x friendly-backup.sh`
2) `./friendly-backup.sh`

> Optional: Add a Cron Job

## Todos
 - [ ] Add a way to backup config files too
 - [ ] Alternative backup for other DBMS
 - [ ] Make an interactive setup?
