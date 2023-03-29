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
