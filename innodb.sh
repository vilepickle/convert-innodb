#############################################################################################
# MySQL InnoDB Table Converter
#
# By David Lohmeyer
# vilepickle@gmail.com
# Vilepickle.com
# 6/7/13
# Version 1.0
# 
# With code adapted from http://kvz.io/blog/2010/04/27/convert-all-tables-to-innodb-in-one-go/
#
#############################################################################################
#
# Copyright (c) 2013 David Lohmeyer
#
# Permission is hereby granted, free of charge, to any person obtaining a copy 
# of this software and associated documentation files (the "Software"), to deal 
# in the Software without restriction, including without limitation the rights to 
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of 
# the Software, and to permit persons to whom the Software is furnished to do so, 
# subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all 
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
# INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A 
# PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT 
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION 
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
# SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
#############################################################################################

DATABASENAME=$1
MYSQLUSER="ROOTUSER"
MYSQLPASSWORD="ROOTPASSSWORD"

echo 'SHOW TABLES;' \
 | mysql -u ${MYSQLUSER} -p${MYSQLPASSWORD} ${DATABASENAME} \
 | awk '!/^Tables_in_/ {print "ALTER TABLE `"$0"` ENGINE = InnoDB;"}' \
 | column -t \
 | mysql -u ${MYSQLUSER} -p${MYSQLPASSWORD} ${DATABASENAME}

