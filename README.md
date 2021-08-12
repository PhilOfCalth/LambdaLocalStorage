# Lambda Local Storage
This is an experimentation area for showing how instance and static variables behave in the functions called by various FaaS offerings. Examples are in Java and Python, though the focus is Java, with the assumption that any findings apply to all object oriented languages deployed.

For use in Naimuri insight/blog post

## AWS Lambda
At the moment all I have done is the AWS version of this code, but the high level finding is that both static and instance variable, are maintained rather than being recreated, on supsiquent callings of the lambda. Therefore the class that wraps the lambda method, is also maintained.

## Running the tests
The scrips script `setupAll.sh`,  and `tearDownAll.sh` need to be called manually to setup the functions in your own account. The scripts require an environment variable `ACCOUNT_ID` set to your account's ID, to run. If you have set up your AWS CLI to use a profile, the scripts can be set to use it by setting the environment variable `AWS_PROFILE`

Usage: `ACCOUNT_ID=<account id> [AWS_PROFILE=<user profile>] ./<script>`
EG: `ACCOUNT_ID=123456789012 AWS_PROFILE=testUser ./tearDownAll.sh`

Calling the lambda functions can be done from the console, though you could create simular scripts to do so if you wish. For the purpose of this experiment, that felt a unnecessary.
