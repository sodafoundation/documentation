# How to create a PR in GitHub with multiple contributors?
## Start a new PR for an issue.

To start a new PR (Pull Request) for an issue, you can follow these steps:

- #### Step1: Fork the repository

  Go to the repository where the issue is located and click on the **"Fork"** button on the top right corner. This will create a copy of the repository in your own account.

- #### Step2: Clone the repository
  Go to your forked repository and click on the **"Clone"**  button. Copy the URL provided.

  `git clone https://github.com/your-username/repo-name.git`

- #### Step3: Create a new branch
   Create a new branch with a descriptive name that relates to the issue you are working on.

  `git checkout -b branch-name`

- #### Step4: Make changes
  Make the necessary changes to fix the issue. Be sure to write clear commit messages as you go.

   `git add . git commit -m "Hey!"`

- #### Step5: Push changes to your forked repository
  Once you have made your changes, push them to your forked repository.

   `git push origin branch-name`

- ####  Step6: Create a pull request
  Go to the original repository where the issue is located and click on the "New pull request" button. Select your forked repository and the branch you just pushed. Write a clear and descriptive title and description for your pull request, including a reference to the issue you are fixing.
- #### Step7: Submit your pull request
  Once you have reviewed and double-checked everything, submit your pull request and wait for feedback from the project maintainers.
  
  
## Allow access to another member(s) to add commits to the PR

To allow another member(s) to add commits to your pull request (PR), you can add them as collaborators to your forked repository. Here are the steps:

#### Step1:
 Go to your forked repository on GitHub and click on the **"Settings"** tab.
    
#### Step2:
  In the left sidebar, click on **"Manage access"**.
  #### Step3:
    
  Click on the **"Invite a collaborator"** button.
    
#### Step4:  
Type in the GitHub username or email address of the person you want to add as a collaborator.

#### Step5:
   Click on the **"Add [username/email]"** button.
    
#### Step6:
The person you added as a collaborator will receive an email inviting them to collaborate on your repository. They will need to accept the invitation.
    

**Once the collaborator has accepted the invitation, they will be able to clone your repository and make changes to your PR by following these steps:**

#### Step7: 
Clone the forked repository to their local machine.
    
#### Step8:
 Checkout the branch where the pull request is located.
    
#### Step9:
 Make the necessary changes and commit them locally.
    
#### Step10:
 Push the changes to the branch in the forked repository.
    
#### Step 11:
 Go to the original repository where the pull request is located and click on the "New pull request" button.
    
#### Step 12:
Select the forked repository and the branch where the collaborator pushed the changes.
    
#### Step13:
Write a clear and descriptive title and description for the pull request, including a reference to the issue being fixed.

#### Step14:
 Submit the pull request.
 
 ## Submit the PR with commits from all contributors assigned to the PR.
 
 To submit a pull request (PR) with commits from all contributors assigned to the PR, follow these steps:

#### Step1:
 Clone the repository to your local machine:

`git clone <repository_url>` 

#### Step2:
Create a new branch for your changes:

`git checkout -b <branch_name>` 

#### Step3:
  Make the necessary changes and commit them:
  
`git add .
git commit -m "commit message"` 

#### Step4:
 Push the changes to the remote repository:

`git push origin <branch_name>` 

#### Step5:
Once you have pushed your changes, go to the repository on GitHub and click on *"New pull request"*.
    
#### Step6:
Choose the branch you just pushed your changes to as the *"head"* branch and select the target branch you want to merge your changes into.
    
#### Step7:
  Add a description to your pull request, explaining what changes you made and why.
    
#### Step8:
  If other contributors have made changes to the same files you modified, their commits will be included in the pull request automatically. If there are no other contributors, skip to step 9.
    
#### Step9:
  If other contributors have made changes to the same files you modified, you will need to merge their changes into your branch before submitting the pull request. To do this, run the following command:
    
`git fetch origin`
`git merge origin/<target_branch>` 

#### Step10:
 Resolve any merge conflicts that arise.
    
#### Step11:
  Once you have resolved any conflicts and all contributors' changes are included in your branch, push your changes to the remote repository:
    
`git push origin <branch_name>` 

#### Step12:
 Go back to your pull request on GitHub and click on *"Create pull request"*.
    
  Review your changes and click on *"Create pull request"* again to submit your PR with commits from all contributors assigned to the PR.



## Use this for all the contributions where more than one contributor is assigned.

When multiple contributors are assigned to a project or task, using a PR (pull request) can help streamline the collaboration process and ensure that everyone is on the same page. Here are some steps to follow when using a PR for collaborative contributions:
#### Step1:
 Create a branch for the new feature or changes you want to make. This will help keep your changes separate from the main codebase until they are ready to be merged in.
#### Step2:
  Make the necessary changes and commit them to your branch. Ensure that your changes are consistent with the project's goals and that you have tested them thoroughly.
#### Step3:
 Create a PR and assign it to the relevant contributors. This will notify them of the changes you have made and allow them to review and provide feedback on your changes.
#### Step4:
 Respond to feedback and make any necessary changes. This is an iterative process, so expect to go back and forth a few times until everyone is happy with the changes.
#### Step5:
  Once the changes have been approved, merge the changes into the main codebase. Be sure to resolve any merge conflicts that may arise and update the relevant documentation as necessary.
#### Step6:
  Celebrate your success and reflect on the collaboration process. Identify what worked well and what could be improved for future PRs.
