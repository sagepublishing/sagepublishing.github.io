---
layout: site
title: 5. Observability journey 
body_class: home
---

This guide documents the accepted and peer reviewed practices for implementing observability at SAGE. The guide has been developed in consultation with development teams in the business and represents the collective best practice all teams working on SAGE projects (in-house or outsourced) should implement.  

Steps 5.1 to 5.5 are mandatory for all projects  

Steps 5.6 to 5.8 are optional, but it is recommended that teams implement them as soon as practically possible.  

The steps in this guide are organised and designed to be implemented in sequence, so be sure to complete each step before skipping ahead. If you are working with an established project, you may have already completed later steps where earlier ones are missing. If so, go back to the start of the journey and implement the gaps in sequence. 


---
 

###Step 5.1: Logs are available easily to the whole support and development organisation 

*Recommended technologies: Amazon Cloudwatch, Azure Monitor*

Logs are a critical tool in supporting and debugging a system, often requiring review at times of pressure when resolving a service issue.

Therefore, they must be easily accessible to the whole support and development organisation, without relying on seperate teams or individual personnel for access. Logs should also be date ordered and searchable.

For that reason it is recommended they are not stored individual servers, which if complying with [Step 2.12](security,html), should be ephemeral and have no access. Instead they should be replicated and consolidated on a central service, available easily to those that need them.

For cloud deployments, Amazon Cloudwatch Logs or Azure monitoring offer a solution. Otherwise, technologies such as [Kibana](https://www.elastic.co/guide/en/kibana/current/observability.html) can offer a similar centralised, searchable experience.

 

###Step 5.2 Logs never contain credentials or secrets 

It is essential that logs do not contain credentials, secrets or other security-critical information.

Consider implementing a library which can sanitise SQL statements, HTTP `Authorization` headers (which can contain tokens) and implement it in a way that does not rely on developers self-sanitising every single log statement.
 

###Step 5.3 Access, application, performance and security log streams are segregated 

Different log streams should be segregated into their relevant categories, and retention and storage policies applied individually to each.

For example, it might be a legislatory requirement to keep access and security logs for 36 months, however detailed application logs might expire after 90 days.

Document your log retention policy in your project's `README.md`.


###Step 5.4 Any Personal information is aged out of logs in an appropriate time window 

Relevant to step 5.3 above, log statements that include personal information must be aged out of log streams according to the relevant laws and duristiction of the user.

Note that GDPR law in the UK & EU now considers a user's [IP address or cookie as personal information](https://ico.org.uk/for-organisations/guide-to-data-protection/guide-to-the-general-data-protection-regulation-gdpr/key-definitions/what-is-personal-data/).


###Step 5.5 Implement key healthcheck metrics on parts of your infrastructure, implement alerts 

Every solution must expose at least one service healthcheck endpoint which can be accessed by third party monitors to determine whether or not the solution is currently healthy. The definition of healthy is that the solution can currently accept and successfully process user requests.

At a minimum, it is recommended that healthchecks cover connections to essential attached storage, databases and APIs that are required for basic operation.

Healthchecks should not reveal implementation information or detail, and should return a simple `OK` style response to indicate good health.

Healthchecks should be integrated with third party monitoring services such as PagerDuty or AWS Cloudwatch alerts, which can notify the operations team when the solution is unhealthy.

Healthchecks can also be used in load balancing situations to determine whether a service needs to be stood down and replaced.



###Step 5.6 Implement a status page for your application or service 

Healthchecks implemented in step 5.7 above can also be integrated into a service page made available to customers. Such pages can increase customer confidence and reduce support requests.
 


###Step 5.7 Implement an observability platform 

*Recommended technologies: New Relic, Azure Insights*

Observability platforms implement deep analysis of the runtimes of your solution, and can drastically reduce the effort to diagnose defects and performance problems. 

It is strongly recommended that you implement one of these platforms on at least part of the running production infrastructure and regularly review performance, runtime errors and transactions to get a better informed view of where improvements can be made.
 