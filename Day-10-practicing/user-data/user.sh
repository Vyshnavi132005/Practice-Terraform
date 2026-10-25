#!/bin/bash

yum install -y git
yum install -y nginx
yum install -y tree
systemctl enable nginx
systemctl start nginx