---
layout: site
title: 3. Code Review journey 
body_class: home
---

This guide documents the accepted and peer reviewed practices for implementing peer code reviews at SAGE. The guide has been developed in consultation with development teams in the business and represents the collective best practice all teams working on SAGE projects (in-house or outsourced) should implement.  

* Steps 3.1 to 3.3 are mandatory for all projects  
* Steps 3.4 to 3.6 are optional, but it is recommended that teams implement them as soon as practically possible.  

The steps in this guide are organised and designed to be implemented in sequence, so be sure to complete each step before skipping ahead. If you are working with an established project, you may have already completed later steps where earlier ones are missing. If so, go back to the start of the journey and implement the gaps in sequence. 

 
---

### Step 3.1: All changes merged to main branch is peer reviewed by at least one team member, via a pull request 

*Required technologies: Azure DevOps/Github Pull Requests*

Peer review is an important quality step on any project, and is mandatory for all code created at SAGE.

Any changes to a respository must be done via branches (see [Step 1.4](source-control.html)) and any branch merged to the main branch must be code reviewed by at least one member, using the VCS's standard Pull Request (PR) mechanism.

Team members should not review their own changes, and all reviews/comments should exclusively be recorded inside the PR, so it can form part of the historical record of the change.

Changes can only be merged when they receive at least one explicit approval.

A [fantastic guide](https://google.github.io/eng-practices/review/) for how to conduct code reviews is provided by the Google engineering team, we urge all team members involved in the Pull Request process to review it.



### Step 3.2: Document coding standards in the project’s README, use them as the minimum criteria for code review 

Coding standards and style vary wildly depending on the project's technology, framework or libraries used. 

However each project's standards should be explicit and included in the project's `README.md`. These documented standards then become the minium criteria used by PR reviewers when deciding to approve or reject changes.

 

### Step 3.3: Enforce a maximum PR size, and a guideline turnaround time, appropriate for your project 

Large PRs are unwieldy to review, risk errors being missed and can take too long to review. Instead, larger changes should be broken up into a set of smaller, easier to digest PRs.

Reviews that sit outstanding waiting for approval risk becoming out of date, or missing their shipping date.

As a guide we would recommend that PRs are no larger than 250 lines of code, or 25 files, and your team implements a 1 business day SLA for review of newly submitted PRs.

However, YMMV depending on your team geography and technology. You should make a decision on PR size and review time, and document it in your project's `README.md`
 

### Step 3.4: Implement code metrics into the review process, as appropriate for your project 


 

### Step 3.5: Implement 30% and 90% feedback for larger or more fundamental changes 

Larger changes can benefit from two peer-reviews, one (marked 30%) to review the technical approach (without reference to detail) and a later review once complete (marked 90%) to cover lower-level review of the completed change.

This allows for constructive feedback at an early stage, without missing the detail and rigour required in the later review. 

[This article](https://blog.sandglaz.com/30-percent-feedback-rule/) explains the philosophy.
 


### Step 3.6: Ensure architectural changes have a peer reviewed Architectural Decision Record, numbered and referenced within the project’s source control 
 
Significant technical decisions should be recorded in an [Architectural Design Record](https://adr.github.io/), which is submitted and reviewed in the same PR as the change.

ADRs should be numbered (so that the order in which the decision was taken is clear) and included in a dedicated folder in the project's source control repository, and form part of the project's documentation.

ADRs should be immutable and not modified later - if a decision needs to be reversed at a later date, a new ADR is raised documenting the reasons for the reversal.

