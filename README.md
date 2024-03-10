# Cloud Engineer assignment
A Cloud Engineer is responsible for the design, management, and maintenance of a cloud infrastructure. 
You have multiple roles and needs toghether with a well-rounded knowledge of software development, scripting languages and a background in designing services in the cloud

## Intro

Once again we thank you for your interest in our company and in the job we are offering. Now it's time for you to show us your best skills. 
Use this opportunity in a professional and wise manner. The main goal of this evaluation is to determine your potential, not flaws: we don't expect everybody to excel at everything. 

If you have a doubt or our requirements are not clear enough please let us know and we will do our best to give you all the information you need and put you in a position to express all your talents. Last but not least, with this assignment we aim to assess not only your technical skills but also your soft skills and communication is one of the most important. Don’t forget it


## Start
As usual our developers created some components and your job it to deploy them in the cloud.
Today we are kindly asking you to containerize and deploy the following components:

* `client`: a web client that displays the data 
* `server`: an API that fetches persisted information and returns it to the web client

## Requirements
Your solution has to meet the following criteria:

* The `client` is deployed on a CDN. Read client [README](src/client/README.md) file to get more details on how to compile the project and get the bundle that has to uploaded to CDN you think works best for this solution
* There must be more than one instance of the `server` API, ideally using Docker and Kubernetes. We provided you a [Dockerfile](src/server/Dockerfile) that you should consider the starting point.
* The `database` is hosted in secure and fault tolerance manner. Using a 3rd party provider is okay as long as can explain why you are using it. Pass the MONGO_URL environment variable to the `server` service. For your info https://cloud.mongodb.com/ has a free tier. 
* A continuous integration pipeline(s) is in place to deploy changes

## Finish
Your finished project should be delivered as:

### Code
Complete the provided code (using the folder structure you think is best) with the infrastructure as code you think is required to complete this assignment. Publish your code in a **private** github repository and give us access to it.

### Cloud environment
Deploy the above mentioned components in a public cloud (choose the one you prefer)
The app should be fully functional.

### Continuous integration
Setup a continuous integration pipeline so that every time a change is published in the above mentioned git repository the *Cloud environment* is update automatically. Saved data can't be impacted by a deployment.


## Assessment
Here below an list of criteria we are going to use to assess your work:
* Scalability and fault tolerance
* Testability of your solution 
* Different design patterns applied
* Performance considerations taken
* Error handling, debugging and logging
* Attention to details

Be prepared to talk about
* Why did you do what you did, how you did it, and how long it took
* Talk about the tech stack and any services used in your project and why you chose them 
