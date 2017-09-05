#!/bin/bash

##########################
# Friendly Backup Script #
##########################

#=====================#
# BEGIN Configuration #
#=====================#

# Number of days to retain backups (default: 10 days)
date=$(date +%Y%m%d)
deldate=`date --date '10 days ago' "+%Y%m%d"`

# Source directory
sourcedir="/my/source/directory"

# Destination direcrtory (backups directory)
destdir="/my/destination/directory"

# Websites (separated by spaces)
sites='website1 website2 website3'

# Databases (separeted by spaces)
databases='database1 database2 database3'

# Database host
db_host='localhost'

# Database user
db_user='my_db_user'

# Database password
db_password='my_db_password'

#=====================#
#  END Configuration  #
#=====================#

#============================#
#  BEGIN Directories Backup  #
#============================#

for site in ${sites}
do

  mkdir -p ${destdir}"/data/"${site}
  tar -czf ${destdir}"/data/"${site}"/"${site}"."${date}".tar.gz" -C ${sourcedir} ${site} --exclude "*.log"

  delfile=${destdir}"/data/"${site}"/"${site}"."${deldate}".tar.gz"
  if [ -f ${delfile} ]
    then unlink ${delfile}
  fi

done

#============================#
#   END Directories Backup   #
#============================#

#============================#
#   BEGIN Databases Backup   #
#============================#

for db in ${databases}
do

  mkdir -p ${destdir}"/db/"${db}
  mysqldump -u ${db_user} -p${db_password} -h ${db_host} -B ${db} -R --skip-lock-tables > ${destdir}"/db/"${db}"/"${db}"."${date}".sql"
  tar -czf ${destdir}"/db/"${db}"/"${db}"."${date}".sql.tar.gz" -C ${destdir}"/db/" ${db}"/"${db}"."${date}".sql"

  if [ -f ${destdir}"/db/"${db}"/"${db}"."${date}".sql.tar.gz" ]
    then unlink ${destdir}"/db/"${db}"/"${db}"."${date}".sql"
  fi

  delfile=${destdir}"/db/"${db}"/"${db}"."${deldate}".sql.tar.gz"
  if [ -f ${delfile} ]
    then unlink ${delfile}
  fi

done

#============================#
#    END Databases Backup    #
#============================#