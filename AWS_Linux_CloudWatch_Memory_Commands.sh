#AWS Linux CloudWatch Memory Commands

#Pre-Reqs
yum install perl-Switch perl-Sys-Syslog perl-LWP-Protocol-https -y
#Download the AWS CouldWatch Samples for Linux Scripts
wget http://ec2-downloads.s3.amazonaws.com/cloudwatch-samples/CloudWatchMonitoringScripts-v1.1.0.zip
#Unzip
unzip CloudWatchMonitoringScripts-v1.1.0.zip 
#CD Into it
cd aws-scripts-mon/
#List out
ls -la
#Verify you can talk to Cloudwatch
./mon-put-instance-data.pl --mem-util --verify -verbose
#Command to send metric to Cloudwatch - Ideally should be cron'd on scripted to run every 1-5 minutes
./mon-put-instance-data.pl --mem-util --mem-used --mem-avail
