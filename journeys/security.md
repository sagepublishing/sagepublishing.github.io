---
layout: site
title: 2. Security
body_class: home
---


This guide documents the accepted and peer reviewed practices for developing securely at SAGE. The guide has been 
developed in consultation with development teams in the business and represents the collective best practice all teams 
working on SAGE projects (in-house or outsourced) should implement.  

* Steps 2.1 to 2.9 are mandatory for all projects  
* Steps 2.10 to 2.12 are optional, but it is recommended that teams implement them as soon as practically possible.  

The steps in this guide are organised and designed to be implemented in sequence, so be sure to complete each step 
before skipping ahead. If you are working with an established project, you may have already completed later steps where 
earlier ones are missing. If so, go back to the start of the journey and implement the gaps in sequence. 

<hr> 

### Step 2.1: Audit existing code and remove any credentials checked into source control, provide a secure mechanism for delivery of credentials 

*Recommended technologies: Azure Key Vault, AWS Secrets Manager*

A very common mistake is to store clear text credentials for databases, external API keys for 3rd party services or 
other credentials in source control. Because source code is downloaded by every developer, as well as stored centrally, 
this means secrets are copied multiple times onto multiple machines over time and pose a very large security threat. 

It is essential that all secrets are removed from source control, and encrypted at rest with a secured key stored 
elsewhere. A strategy to integrate secrets into the code is implemented at run time.  

The general pattern is to integrate secrets via environment variables that are populated from a secure or encrypted 
source. Multiple technologies exist to facilitate this such as Azure Key Vault (for cloud runtime) Docker Secrets, 
Kubernetes Secrets, AWS Secrets Manager. The technology on local environment may be different to the production runtime. 

Do not create your own solution for secret management, use one of the existing solutions provided by your Cloud provider 
or container vendor. 

Document your choice in the project’s README file. 

 
### Step 2.2 Workloads never run as root, or use root account credentials 

Any processes such as web servers, databases, background jobs or scripts should never run as the root user. Instead they
should run using a dedicated user with the minimum amount of priveledges required to execute. 

Cloud workloads that run in an environment controlled by the provider, such as Azure Functions or AWS Lambda functions,
should only be granted the minimum permissions required to execute, and should not run using roles that grant root-like
or a wide base of permissions to the function.

Never use the cloud account root user or credentials in any circumstances.

 
### Step 2.3 Environments do not share credentials 

Production, QA/test and development environments should not share credentials. Provision distinct sets of credentials 
for each distinct environment.

Furthermore, environments should never re-use a given (human) user's credentials.


### Step 2.4 Developer credentials should be short lived 

*Recommended technologies: AWS IAM Identity Center, Azure ....*

Where available, developers should use short-lived credentials for access to services. This is because these credentials
are often copied onto multiple end-user workstations that are difficult or impossible to centrally control,
unlike server environments, especially where those developers work for suppliers or agencies outside SAGE. 

So it is best practice for any privileged developer credentials to be session-based.

For example, AWS `access_key_id` and `secret_access_key` are required for CLI and code-based access to AWS APIs and
services. However, for human users, they can be provisioned on a session-by-session basis using technologies like
[IAM Identity Center](https://aws.amazon.com/iam/identity-center/) and will expire with the user's logged in session. 

For Azure....
 

### Step 2.5 Code reviews include a static security review  

*Recommended technologies: [OWASP Top Ten](https://owasp.org/www-project-top-ten/)*

When performing code reviews, developers must include a static security review of code, using an industry-recognised 
checklist. 
 
An example of such a checklist for web applications is the [OWASP Top Ten](https://owasp.org/www-project-top-ten/).
 

### Step 2.6 Environments are bounded, and production and non-production workloads do not share the same infrastructure, container or accounts 

*Recommended technologies: Azure Resource Groups, AWS Organizations, Docker, Kubernetes* 

Environments should be bounded (self-contained) and not share resources or infrastructure, such as network interfaces,
databases and filesystems. 

Cloud production and non-production workloads should also have a further logical segregation, and run in seperate 
accounts (AWS - accounts can be grouped using Organizations) or Resource Groups (Azure - within the same master 
account).


### Step 2.7 Cloud environments implement continuous security and threat detection monitoring across all environments 

*Recommended technologies: Azure Security Controls, AWS GuardDuty*
 
Cloud environments should make use of the vendor's threat detection solutions and these solutions should be run
continuously. 


### Step 2.8 Ensure all developers receive basic training on common code exploits 

*Recommended technologies: [OWASP Academy](https://owasp-academy.teachable.com/)*

When developers are on-boarded to the business, they should receive basic training on common code exploits relevant to the type of development domain they are undertaking (in the case of SAGE, this is usually web).

OWASP provide a free academy program for this purpose.
 

### Step 2.9 Secret rotation 

*Recommended technologies: AWS Secrets Manager, Azure ...*

Application secrets such as API or database credentials and SSH keys should be regularly rotated, preferably automatically.

Technologies such as AWS Secrets Manager allow you to perform secret rotation for AWS managed resources automatically, and provide code hooks to implement Lambda functions to rotate non-PaaS resources. This method is preferred to the manual method of secret rotation. 
 

### Step 2.10 Engage a third party to perform black- and white-box vulnerability testing 

Each product should engage a third party to perform black- and white-box testing at least annually.

Any exposed risks should be recorded on a risk register, urgent risks are fixed as soon as possible, other risks are
reviewed quarterly and scheduled as appropriate.
 
  

### Step 2.11 Cloud Only: Review and implement vendor’s recommended well-architected patterns  

*Recommended technologies: [AWS Well Architected Framework](https://docs.aws.amazon.com/wellarchitected/latest/framework/welcome.html), [Azure Architecture Review](https://learn.microsoft.com/en-gb/assessments/azure-architecture-review/)*

Both Azure and AWS provide patterns for correct implementation of solutions. These should be followed to ensure 
solutions are making best use of the security patterns provided. 


Via certified third-party partners, AWS provide both a free review service, and an account credit ($5000) for any 
remediation activity.

Azure ...


### Step 2.12 Implement no-SSH/no-modify for production deployments 

*Recommended technologies: Azure Containers, AWS Elastic Container Service*

The safest environments are those that provide no access for modification once running, and can only be modified by a 
peer-reviewed change controlled process.

Resources provisioned in this way are considered ephemeral, when changes are required they are disposed of and replaced 
with new resources.

For server-based environments, consider solutions based on container technologies where container images are build using
a peer-reviewed pipeline process, and can be quickly deposed of and redeployed when a new image is available.
