# Terraform Scaffold (terraform-scaffold)

Simple Terraform scaffold for the base of your projects.

- [Overview](#overview)
- [Usage](#usage)
- [Bootstrap](#bootstrap)
- [Plan](#plan)
- [Apply](#apply)
- [Destroy](#destroy)
- [Structure](#structure)

<a name="overview"></a>
### Overview

Un-opinionated lightweight scaffolding of a basic terraform repo. Deliberately lightweight (& for the time being un-finished).

< name="role"></a>
### Minimum IAM policy

This document describes the minimum IAM policy required to run [core examples](https://github.com/aws-ia/terraform-aws-eks-blueprints/blob/main/.github/workflows/e2e-parallel-full.yml#L30-L47) that we run in our [E2E workflow](https://github.com/aws-ia/terraform-aws-eks-blueprints/blob/main/.github/workflows/e2e-parallel-full.yml) , mainly focused on the list of IAM actions.

> **Note**: The policy resource is set as `*` to allow all resources, this is not a recommended practice.

~~~yaml
{% include "min-iam-policy.json" %}
~~~


<a name="usage"></a>
### Usage

### First Clone the github repo

<a name="bootstrap"></a>
##### Bootstrap

You can get setup using an s3 bucket as backend for terraform simply with the following. Be sure to check the variables.tf defaults and override them if you like.
This bootstrap is to save the state of the terraform file, you have to initialise and apply it before working with the shell script.
It will prompt you to give some values like the bucket name, aws_region, environment, project and component


```
cd terraform/bootstrap
terraform init
terraform plan -out tfplan.out
terraform apply "tfplan.out"
```
After the s3 bucket for the state has been created, you can run the shell script labelled under bin as tfscaffold.sh

### NOTE

The s3 bucket for state locking must be specified in the s3_bucket of the tfscaffold.sh file before running the plan command 


<a name="scaffold_script"></a>
After the s3 bucket for the state has been created, you can run the shell script labelled under bin as tfscaffold.sh
The shell script can be use to run a plan, apply or destroy on the different environments. 
example: ./tfscaffold.sh plan dev us-east-1
./tfscaffold.sh - the scriptname 
plan - the terraform command
dev - the environment  
us-east-1 - the region 

<a name="plan"></a>
##### Plan

dev plan >
```

cd bin/
./tfscaffold.sh plan dev us-east-1
```

prod plan >
```
cd bin/
./tfscaffold.sh plan prod us-east-1
```

<a name="apply"></a>
##### Apply

dev apply >
```

cd bin/
./tfscaffold.sh apply dev us-east-1
```

prod apply >
```
cd bin/
./tfscaffold.sh apply prod us-east-1
```

<a name="destroy"></a>
##### Destroy

dev destroy >
```

cd bin/
./tfscaffold.sh 'apply -destroy' dev us-east-1
```

prod destroy >
```
cd bin/
./tfscaffold.sh destroy prod us-east-1
```

<a name="structure"></a>
### Structure

```
|____README.md
|____bin
| |____tfscaffold.sh (*performs orchestration of runs)
|____.gitignore
|____terraform
| |____environments
| | |____dev (*environment code - perhaps main.tf etc)
| | | |____main.tf
| | | |____outputs.tf
| | | |____variable.tf
| | | |____versions.tf
| | | |____README.MD
| | |____prod
| | | |____main.tf
| | | |____outputs.tf
| | | |____variables.tf
| | | |____versions.tf
| | | |____README.MD
| |____templates (*dir for all templates)
| |____modules (*modules would be developed)
| | |____example
| | | |____README.md
| | | |____main.tf
| |____bootstrap (*bootstrap tf files, setup environment etc)
| | |____.terraform-version
| | |____s3_state_bucket.tf
| | |____provider_aws.tf
| | |____variables.tf
| |____components (*shared components - default variables, backend config etc) etc
| | |____backend.tf
```

### NOTE

Changes can be made to the variables in either the dev or the prod environment to suit whatever your needs might be.
