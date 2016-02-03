#!/bin/bash

#AWS Linux CloudWatch Memory and Disk Commands-Should Work on Amazon Linux AMI's with an associated CloudWatch IAM Role

#Pre-Reqs
yum install perl-Switch perl-Sys-Syslog perl-LWP-Protocol-https -y
#Download the AWS CouldWatch Samples for Linux Scripts
wget http://ec2-downloads.s3.amazonaws.com/cloudwatch-samples/CloudWatchMonitoringScripts-v1.1.0.zip
#Unzip
unzip CloudWatchMonitoringScripts-v1.1.0.zip 
#copy script to /opt/aws/bin/
cp -R aws-scripts-mon /opt/aws/bin/
#List out
ls -la
#Verify you can talk to Cloudwatch
/opt/aws/bin/aws-scripts-mon/mon-put-instance-data.pl --mem-util --verify -verbose 
#add line to crontab to run every 5 minutes
line="*/5 * * * * root /opt/aws/bin/aws-scripts-mon/mon-put-instance-data.pl --mem-util --mem-used --mem-avail --disk-space-util --disk-path=/ --from-cron
echo "$line" >> /etc/crontab
#restart crond
service crond restart