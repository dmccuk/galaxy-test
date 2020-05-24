#!/bin/bash
EC2_INSTANCE_TYPE=`curl -s http://169.254.169.254/latest/meta-data/instance-type`
EC2_AVAIL_ZONE=`curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone`
EC2_REGION="`echo \"$EC2_AVAIL_ZONE\" | sed 's/[a-z]$//'`"
AMI_ID=`curl -s http://169.254.169.254/latest/meta-data/ami-id`


echo "EC2_INSTANCE_TYPE: "$EC2_INSTANCE_TYPE >> /etc/ansible/facts.d/local.fact
echo "EC2_AVAIL_ZONE: "$EC2_AVAIL_ZONE >> /etc/ansible/facts.d/local.fact
echo "EC2_REGION: "$EC2_REGION >> /etc/ansible/facts.d/local.fact
echo "AMI_ID: "$AMI_ID >> /etc/ansible/facts.d/local.fact

case $EC2_AVAIL_ZONE in
	eu-west-1b)
	 echo "environment: Production" >> /etc/ansible/facts.d/local.fact
	;;
	*)
	 echo "environment: Dev" >> /etc/ansible/facts.d/local.fact
	;;
esac




#which apt ; STATUS=$?

#case $STATUS in
#        0)
#         PACKAGES=`dpkg -l | tail -n +6 | awk -F" " '{print $2"."$3","}'`
#         echo "PACKAGES: "$PACKAGES >> /etc/ansible/facts.d/local.fact
#        ;;
#        *)
#         PACKAGES=` for i in \`rpm -qa\`; do echo -n $i","; done`
#         echo "PACKAGES: "$PACKAGES >> /etc/ansible/facts.d/local.fact
#        ;;
#esac
