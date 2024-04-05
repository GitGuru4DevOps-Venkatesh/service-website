# CreativeHub
DigitalDreamScapesNetwork - Your Creative Hub

Certainly! Let's set up Jenkins to automatically deploy changes from your GitHub repository to your website hosted in a Docker container. Here are the clear steps to achieve this:

1. **Install Jenkins**:
   - First, make sure you have Jenkins installed on your server. If not, follow these steps:
     - Update your system: `sudo apt update`
     - Install Java 11: `sudo apt install openjdk-11-jre`
     - Add Jenkins repository key: `curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null`
     - Add Jenkins repository: `echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null`
     - Update and install Jenkins: 
       ```
       sudo apt-get update
       sudo apt-get install fontconfig openjdk-11-jre
       sudo apt-get install jenkins
       sudo systemctl enable jenkins
       sudo ufw allow 8080
       sudo systemctl start jenkins
       ```
     - Install Docker (if not already installed): `sudo apt install docker.io`
     - Add your user to the Docker group: `sudo usermod -a -G docker $USER`
     - Make Docker socket accessible: `sudo chmod 777 /var/run/docker.sock`

2. **Create a Jenkins Job**:
   - In Jenkins, create a new job:
     - Click on "New Item."
     - Enter a suitable name for your project.
     - Select "Pipeline project."
     - Enable "GitHub hook trigger for GITScm polling" to run the pipeline whenever there's a new commit in GitHub.

3. **Configure GitHub Integration**:
   - Go to your GitHub repository settings.
   - Click on "Webhooks" and then "Add webhook."
   - In the "Payload URL" field, paste your Jenkins environment URL. Append `/github-webhook/` to the URL.
   - Select "application/json" as the content type and leave the Secret field empty.

4. **Write the CI/CD Pipeline**:
   - In your Jenkins job configuration, define the pipeline:
     - If using a private repository, configure the OAuth token in Jenkins credentials.
     - Create a Jenkinsfile (or use a scripted pipeline) that defines your build and deployment steps.
     - For example:
       ```groovy
       pipeline {
           agent any
           stages {
               stage('Checkout') {
                   steps {
                       checkout scm
                   }
               }
               stage('Build') {
                   steps {
                       sh 'docker build -t service-website .'
                   }
               }
               stage('Deploy') {
                   steps {
                       sh 'docker run -d -p 80:80 service-website'
                   }
               }
           }
       }
       ```

5. **Test the Pipeline**:
   - Manually trigger the job and ensure the web app is deployed.
   - Wait for periodic builds and verify the deployment.
   - Make changes to the web app, commit, and check if Jenkins automatically triggers a build.
   - If using GitHub, push changes to the GitHub repository and verify that the webhook triggers Jenkins.

Remember to adjust the pipeline according to your specific project requirements. With Jenkins in place, your website will automatically reflect changes made in your GitHub repository. 🚀.

Source: Conversation with Bing, 05/04/2024
(1) Automating Deployment with Jenkins and GitHub: Continuous ... - Medium. https://medium.com/@kavajay98/automating-deployment-with-jenkins-and-github-continuous-integration-1ce7f58a97a9.
(2) How to Integrate Your GitHub Repository to Your Jenkins Project. https://dzone.com/articles/how-to-integrate-your-github-repository-to-your-je.
(3) Deploying a Simple Web App with Jenkins: A Step-by-Step Guide. https://medium.com/@ramthecuber320/deploying-a-simple-web-app-with-jenkins-a-step-by-step-guide-a2e0b6aaf0cc.
(4) How to push changes to github after jenkins build completes?. https://stackoverflow.com/questions/19922435/how-to-push-changes-to-github-after-jenkins-build-completes.
(5) undefined. https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key.
(6) undefined. https://pkg.jenkins.io/debian-stable.
(7) en.wikipedia.org. https://en.wikipedia.org/wiki/Jenkins_(software).
---------------------------------
If you've made changes directly on GitHub (for example, by editing a file in the GitHub web interface or by merging a pull request), you will need to fetch those changes into your local repository to see them reflected in your cloned repository.

Here's what you need to do:

1. **Fetch Changes**: In your local repository, fetch the changes from the remote repository. This updates your local repository with the changes made on GitHub.

   ```bash
   git fetch origin
   ```

2. **Merge Changes**: After fetching, you may need to merge the changes into your local branch. If you're not currently on the branch where the changes were made, switch to that branch first.

   ```bash
   git checkout your_branch_name
   ```

   Then merge the changes:

   ```bash
   git merge origin/your_branch_name
   ```

   This command merges the changes from the remote branch into your current local branch.

3. **Review Changes**: Once you've merged the changes, review them to ensure everything looks correct.

4. **(Optional) Push Changes**: If you want to push these changes to another remote repository or if you've made additional changes locally, you can push them to the remote repository.

   ```bash
   git push origin your_branch_name
   ```

With these steps, the changes you made directly on GitHub should now be reflected in your cloned repository. Remember to replace `your_branch_name` with the name of the branch where the changes were made.

