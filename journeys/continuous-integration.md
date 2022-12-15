---
layout: site
title: 4. Continuous Integration journey 
body_class: home
---

This guide documents the accepted and peer reviewed practices for working with continuous integration at SAGE. The guide has been developed in consultation with development teams in the business and represents the collective best practice all teams working on SAGE projects (in-house or outsourced) should implement.  

* Steps 4.1 to 4.6 are mandatory for all projects  
* Steps 4.7 & 4.8 are optional, but it is recommended that teams implement them as soon as practically possible.  

The steps in this guide are organised and designed to be implemented in sequence, so be sure to complete each step before skipping ahead. If you are working with an established project, you may have already completed later steps where earlier ones are missing. If so, go back to the start of the journey and implement the gaps in sequence. 

 
---
 

###Step 4.1: Choose a continuous integration platform 

*Recommended technologies: Azure Pipelines, Github Actions, Circle CI*

Your CI platform runs and keeps track of your builds, triggered by your source control system. For that reason we recommend a CI platform that is very closely integrated, or part of, your source control repository. Azure Devops, Github and Bitbucket all provide in-house options. Alternatively, cloud options such as Circle CI are a good choice.  

Try and avoid self-install options such as Jenkins, as these require additional knowledge and maintenance from your team to keep running smoothly, diverting team resource away from other development tasks. 

 

###Step 4.2: Implement the smallest possible build, and have it report a pass (green)/fail status.  

How your team operates with source control (and other development practices) will be set by the policies and strategies you will choose later on in this guide. To ensure these choices are clear to developers, both existing and new, you will document these choices in a README file in the root folder of the project’s repository. 

Documenting development practices cuts down on ambiguity and interpretation. By placing this documentation in the repository, it is versioned along with the code and also benefits for a change history over time as practices evolve. Team members can also pull request the README to gather feedback and consensus on changes to project practices. 

 

###Step 4.3: Your main branch should always have a green CI build, make noise when it is not green 

The `main` branch is sacred and should be always in a releasable state, so requires a green build status.

If for any reason the `main` branch becomes broken, it is the immediate responsibility of the individual who last merged to it to fix it. For this reason we strongly recommend merges to `main` are not done right at the end of the day, or before a holiday or other absence, as you must be in a position to wait for a passing build.

The failure of a `main` branch build should also be noisy, the whole development team should receive notifications via IM, email or both as to its broken status.
 


###Step 4.4: Integrate and enforce house code style into your CI build 

In the code review journey, [step 3.2](code-review.html) discusses code style and linting. House code style should be enforced by a linter and integrated into the CI build process.

For existing projects, this might be done in a series of smaller steps, with rules implemented one by one (with appropriate linting fixes) due to the amount of code change required.

For new projects, implement a linter from the outset with a full rule set.

It is recommended that pre-commit hooks that automatically run the linter are implemented, most linters can fix basic problems in-place without requiring re-work.

 
###Step 4.5: Integrate automated (unit test and integration) test runs into your CI build. If you don’t have a test suite, create one 

Automated test suites are an essential part of a good quality project, and they should be part of the CI build pipeline. 

If your project does not have an automated test suite, start one and make sure each build runs it and produces a build fail result if any tests are fail.


###Step 4.6 Branches subject to final pull request should have green build status
 

###Step 4.7: Run the CI build on every commit 

Errors caught early are cheaper and easier to fix. Consider running a CI build on every commit, even in development branches. 

It may be that the pipeline run for commits has less steps than the pipeline for merges to `main`, for example lengthy automated browser tests might be omitted. However, even more limited CI feedback is useful in the development process, to catch errors, missing test coverage or failed tests early.
 
 

###Step 4.8: Integrate code metrics tools into your CI build, and establish pass/fail criteria 

If you are using code metrics, such as minimum unit test coverage, or even more complex heuristics such as those available via [SonarQube](https://www.sonarqube.org/developer-edition), integrate these metrics into your CI pipeline and establish pass/fail criteria.

 