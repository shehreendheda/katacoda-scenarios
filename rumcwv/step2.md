In the terminal on the right, the enviroment is being prepared. You will see a message `Provisioning Complete` along with some login credentials when the environment is prepared.

Click the `IDE` tab. It may take a few seconds to load. Once the IDE loads, open the file `deploy/docker-compose/docker-compose-slowads.yml`{{open}} to view the file in the editor. 

This docker-compose file brings the Storedog app online and instruments the Datadog agent and Storedog app services for monitoring with Datadog. 
     
All <a href="https://docs.datadoghq.com/agent/docker/?tab=standard" target="_blank">configuration in a Docker environment</a> is done through environment variables, volumes, and Docker labels.

Because the application is run in a Docker (containerized) environment, the Datadog Agent runs in a container alongside the application containers: `agent`. 
     
Each application service runs in its own Docker container: `discounts`, `frontend`, `advertisements`, and `db`.

Let's configure RUM for the app services.

1. In a new browser window/tab, use the login credentials provided in the terminal to log in to the <a href="https://app.datadoghq.com/account/login" target="_datadog">Datadog account/organization</a> that was created for you for this activity.

    Note: If the credentials are not displayed in the terminal, run the command `creds`{{execute}} in the terminal.

2. To get started with RUM in Datadog, you need to set up a Datadog RUM application. Navigate to the <a href="https://app.datadoghq.com/rum/list" target="_datadog">**UX Monitoring > Rum Applications**</a>.

3. Click **New Application**.

4. Under **Set your application details**, select **JS** as the **Application type** because you are integrating the app using Javascript.

    Enter **Storedog** as the **Application name**.

    Click **Create New RUM Application**.

5. If you are using NPM to manage dependencies for your project front end, you can integrate RUM using the `@datadog/browser-rum` package. However, here we are just going to add the JavaScript inline, so select the `CDN Sync` tab:

    ![cdnsync](rumcwv/assets/cdnsync.png)

6. On the right, click the `IDE` tab.  

    Open the file `store-frontend-instrumented-fixed/app/views/layouts/application.html.erb`{{open}}. This Ruby file is the main template for the Storedog app. By integrating the RUM script here, RUM will be available throughout the application.

    **Lines 10-19** are the RUM script in the front end and set the initialization arguments. This code may be slightly outdated (and different) than the current code snippet in the Datadog UI. It will still work.

    Notice that you code snippet includes environment variables for `applicationId` and `clientToken`.

7. Click the Terminal tab on the right. Set the env `applicationId` and `clientToken` using environment variables:
    
    Copy the `applicationId` from the RUM UI page. In the terminal, assign the value you copied to to `DD_APPLICATION_ID` using the `export` command: `export DD_APPLICATION_ID=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx`

    Copy the `clientToken` from the RUM UI page. In the terminal, assign the value you copied to to `DD_CLIENT_TOKEN` using the `export` command: `export DD_CLIENT_TOKEN=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx`
    
    Run this command to verify that you saved the variables: `echo $DD_APPLICATION_ID $DD_CLIENT_TOKEN`{{execute}}

8. Click `docker-compose up -d`{{execute}} to start the storedog app. Docker will pick up the environment variables you set in the host and pass them along to the containers. Once the app is running, you will see the following in the terminal.

    ![docker-compose-up](rumcwv/assets/docker-compose-up.png)