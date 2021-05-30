# Assignmet Submission 

# code
1. es.tf (bring an aws instance & install es by running setup.sh file)
2. setup.sh (installment instructions)
3. variables.tf (dynamic variables used durng setup)

# Feature 
1. create a single ES node on aws in us-east-1
2. requires credentials to access
3. It works on https to provides encrypted
communication


# Installation 
## Requirements

    aws cli setup
    terraform
    setup aws access keys on ENV

## Run
    cd <this folder>
    terraform init
    terraform plan
    terraform apply
Note : You get the password of default users during installation.(save them)

# Some answers:
1. What did you choose to automate the provisioning and bootstrapping of the instance? Why?
```
Used terraform, I am most aware of terraform & ansible. because agentless & community support. out of these two terraform used for infrastructure and ansible most suitable for configuration management.
So, I used terraform. we can discuss more on this on discussion part.  
```

2. How did you choose to secure ElasticSearch? Why?
```
equires credentials to access
https to provides encrypted communication
```
3. How would you monitor this instance? What metrics would you monitor?
```
Node performance like- cpu & memory
metrics related to index performance
cluster health (not applicable here because single ndoe )
jvm health (pool size, garbage collection)
```
5. Could you extend your solution to launch a secure cluster of ElasticSearch nodes? What
would need to change to support this use case?
```
yes, we can do this but I have no idea because I never work on elastic search.
```
5. Could you extend your solution to replace a running ElasticSearch instance with little or no
downtime? How?
```
Yes but I need to do more research on this.
```
6. Was it a priority to make your code well structured, extensible, and reusable?
```
Yes
```
7. What sacrifices did you make due to time?
```
we can restrict ips as well to make it more secure.
3 node cluster creation
securing node communication with https 
not able to test the code end to end
```