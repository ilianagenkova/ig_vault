#!/bin/bash

module load prod_util
msg="TESTING prod_util mail.py"
echo  "$msg" | mail.py –c iliana.gekova@noaa.gov

