# How to Contribute to all the projects under SODA Projects
This is an example of basic steps of contributing to any project under SODA Foundation through github.

## Step 1: Fork  repository

Before making modifications of SODA Foundation projects, you need to make sure that this project have been forked to your own
repository. It means that there will be parallel development between the respective SODA Foundation repo and your own repo, so be careful
to avoid the inconsistency between these two repos.

## Step 2: Clone the remote repository

If you want to download the code to the local machine, ```git``` is the best way:
Example:
```
git clone https://your_repo_url/api.git
```

## Step 3: Configure upstream repository

To reduce the conflicts between your remote repo and the project repo, we SUGGEST you configure respective repo as the upstream repo:
```
git remote add upstream https://github.com/sodafoundation/api.git
git fetch upstream
```

## Step 4: Develop code locally

To avoid inconsistency between multiple branches, we SUGGEST checking out to a new branch:
```
git checkout -b new_branch_name upstream/development
git pull
```
Then you can change the code arbitrarily.

## Step 5: Push the code to the remote repository

After updating the code, you should push the update in the formal way:
```
git add .
git status (Check the update status)
git commit -m "Your commit title"
git commit --amend (Add the concrete description of your commit)
git push origin new_branch_name
```

## Step 6: Pull a request to  repository

In the last step, your need to pull a compare request between your new branch and respective repo development branch. After
finishing the pull request, the travis CI will be automatically set up for building test.

## Still you need support?
Please join [SODA Foundation Slack](https://sodafoundation.io/slack) and ping us in #general channel. We are happy to support you.

Wish you good luck as an open source developer!
The tutorial is done, enjoy your contributing work!
