---
layout: site
title: 1. Source Control
body_class: home
---

This guide documents the accepted and peer reviewed practices for working with source control at SAGE. The guide has been developed in consultation with development teams in the business and represents the collective best practice all teams working on SAGE projects (in-house or outsourced) should implement.  

* Steps 1.1 through 1.4 are **mandatory** for all projects  
* Steps 1.5 through 1.9 are *optional*, but it is recommended that teams implement them as soon as practically possible.  

The steps in this guide are organised and designed to be implemented in sequence, so be sure to complete each step before skipping ahead. If you are working with an established project, you may have already completed later steps where earlier ones are missing. If so, go back to the start of the journey and implement the gaps in sequence. 

<hr>

### Step 1.1: Implement a source control management system based on git 

*Required technologies: Git, one of either Azure DevOps or GitHub*

Git is the required source control management system at SAGE and where possible teams should look to upgrade from other systems such as SVN, Mercurial, TFS or CVS. 

Git is a distributed system where every local machine stores a full version history of the repository. Changes can be pushed and integrated to a remote server. Development teams should not implement and run their own remote git repositories, instead they should choose hosted cloud-solution - either Azure DevOps or GitHub – using the centrally provided organization accounts provided by your relevant business unit. 

If you are using GitHub, code should be managed under the [SAGE Publishing](https://github.com/sagepublishing) organization. If you are using Azure DevOps, code should be managed under the [SAGEPub](https://dev.azure.com/SAGEPub/) organization.

 
### Step 1.2: Implement a `README` at the project’s root 

How your team operates with source control (and other development practices) will be set by the policies and strategies you will choose later on in this guide. To ensure these choices are clear to developers, both existing and new, you will document these choices in a `README` file in the root folder of the project’s repository. 

Documenting development practices cuts down on ambiguity and interpretation. By placing this documentation in the repository, it is versioned along with the code and also benefits for a change history over time as practices evolve. Team members can also pull request the `README` to gather feedback and consensus on changes to project practices. 

 
### Step 1.3: Implement an .gitignore file to prevent unwanted files ending up in source control 

Developer-specific local files such as IDE settings, local build results, generated code and packages brought in via a package manager should not be committed to source control.  

Implement a .gitignore file at the project’s root to stop these files being committed to source control. 

 
### Step 1.4: In progress work is always done on branches, the main branch is always releasable 

Ensure no development work is done in the main (or trunk) branch, the main branch should always represent the latest releasable version of the project.  

Releasable doesn’t mean you need to actually release every revision merged to main, but each revision should meet the project’s standards for releasability – that is usually that the code is feature complete, compiles, passes the relevant test standards for the project and has been reviewed. If continuous integration builds are in place, only branches with green/passing build status should be merged to main. 

All development and testing work is done in branches off the main branch. 

By making sure main is always releasable, and therefore has a clear merge history, team members always know what the status of the main branch is without consulting others, and it is clear there is always a release candidate available for release. 

Feature branches for individual task work should be short lived, ideally no more than a single sprint, to avoid working in stale code or creating future merge risks. If a feature branch must be maintained for longer than a single sprint it is the responsibility of the branch owner to regularly pull origin/main.


### Step 1.5: [OPTIONAL] Implement and document your team’s branching strategy 

Now all work happens outside of the main branch, your team must choose a branching strategy with an appropriate naming policy, and stick to it. The branching strategy should be documented in the project’s `README` file. 

Typical branching strategies include branching at the start of a sprint and having developers create and merge back feature branches for each development task. 

Each branch should implement a clear naming policy that allows any team member at a glance to understand what the branch is for.  

For feature branches, this may encode the date (prefer reverse format for correct sorting), the ticket number and a brief description. Separate sections with an underscore (_) and use dash (-) to replace spaces. For example: 

`/20220506_tck-346_implement-calandar-control/`

Document your naming strategy in the project’s `README` file. 

By making sure work is partitioned effectively in branches, and having developers work in feature branches you remove dependencies between developers working on different tickets and allow them to commit their work frequently with an appropriate version history without fear of impacting others. 

 
### Step 1.6: [OPTIONAL] Implement and document your team’s commit strategy 

Now your team are doing their work in branches, it’s time to define your commit strategy and document it in the project’s `README` file. Commit strategy is one of the essential thing for source control as it describes the work change status which makes changes easier to review, and if needed to revert the changes with less work loss. 

To come up with thoughtful commits strategy/message, consider the following: 

* Why have I made these changes? 
* What effect have my changes made? 
* Why was the change needed? 
* What are the changes in reference to? 

#### Suggested guidelines 

Capitalization and Punctuation: Capitalize the first word and do not end in punctuation. If using Conventional Commits, remember to use all lowercase. 

<dl>
<dt>Mood:</dt> 
<dd>Use imperative mood in the subject line. Example – `Add fix for dark mode toggle state`. Imperative mood gives the tone you are giving an order or request.</dd>

<dt>Type of Commit:</dt> 
<dd>Specify the type of commit. It is recommended and can be even more beneficial to have a consistent set of words to describe your changes. Example: Bugfix, Update, Refactor, Bump, and so on.</dd>

<dt>Length:</dt> 
<dd>The first line should ideally be no longer than 50 characters, and the body should be restricted to 72 characters.</dd>

<dt>Content:</dt> 
<dd>Be direct, try to eliminate filler words and phrases in these sentences (examples: though, maybe, I think, kind of). Think like a journalist.</dd>
</dl>

##### Sample Template 
 
````
<type>[optional scope]: <description> 

 
[optional body] 

 
[optional footer(s)] 
````
 
##### Sample 

````
fix: fix foo to enable bar 


This fixes the broken behavior of the component by doing xyz.  
 
BREAKING CHANGE 

Before this fix foo wasn't enabled at all, behavior changes from <old> to <new> 


Closes STS-123 
```` 


### Step 1.7: [OPTIONAL] Implement and document your team’s merge strategy 

When a piece of work is complete, tested and ready to be merged back into the main line of development, your team has some policy choices to make. We describe those choices in merge policies. What is your merge strategy? It largely depends on team cadences and on what works best for the product development. Team discussion is the key here, past experiences and industry best practices will help the team to finalize robust merge strategy. For best merge strategy in place consider the following factors in your team discussion and conclude accordingly 
 
1. Discuss and agree if team want a linear or non-linear commit history. [insert demonstration of linear and non-liner history – or link to reference on web] 
1. Discuss on increasing code stability, developer productivity, and to avoid unnecessary conflicts. [insert example strategy] 
1. Discuss on having a policy that allows the integration of rapid changes while still enforcing mechanisms to ensure quality, which removes the confusion of moving fast and provides direction to your development team. [insert example strategy] 
1. Discuss on separating changes into small, discrete units can help encourage testing changes in isolation, increasing the odds of identifying bugs and defects earlier in your software development lifecycle. [insert example strategy] 
 
Having said above teams should adopt the best-fitting branch-merge strategy and rely on existing resources and plugins from their build orchestration tools. Over time, the team can iteratively add quality gates and adopt smaller-scoped branches, reducing release sizes and cycle time to bring features to production faster. 

Once your merge strategy is decided document it in your `README` file. 

 
### Step 1.8: [OPTIONAL] Dependencies should be brought in via a package manager and not via sub-modules 

Do not use the git sub-module feature to manage dependencies, instead use a package manager such as NuGet, npm or other language-specific alternative.  

Linking to dependencies via sub-modules is error prone, does not explicitly define dependancy versions or the dependency tree, and leaves developers to manually manage package’s own dependencies. In addition, the security features implemented by many package managers (flagging outdated or insecure packages) are averted. 

Make sure you implement a line in your .gitignore file ([step 3](#step-13-implement-an-gitignore-file-to-prevent-unwanted-files-ending-up-in-source-control)) to stop the packages being committed to source control. The source control’s configuration file should of course be included. 


### Step 1.9: [OPTIONAL] Implement automated repository policies 

Azure DevOps and GitHub allow repository administrators to implement automated policies to protect the main branch, enforce pull requests and control who can merge.  

[insert settings page graphic from Azure DevOps and Github here to demonstrate] 

Review and implement these policies for your project’s repository to reduce human error and enforce your workflow.