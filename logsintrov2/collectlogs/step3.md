7. In a new window/tab, log in to the <a href="https://app.datadoghq.com/account/login" target="_datadog">Datadog account/organization</a> that was created for you by learn.datadoghq.com. 

8. If you have previously used the **Log Explorer** in the Datadog organization you are working in, move on to the next step. 
    
    If you are working in a new Datadog organization, you have to first enable Log Management before you can continue. Navigate to <a href="https://app.datadoghq.com/logs" target="_datadog">**Logs**</a>. Click **Getting Started**, then click **Start Trial** in the pop-up window. Select **Container**, then select the **docker** tile. Scroll to the bottom and click **Explore your Logs**.

9. Navigate to the <a href="https://app.datadoghq.com/logs" target="_datadog">**Log Explorer**</a> in Datadog. 

    Notice that only logs from the Datadog Agent are being collected .

10. Click an Agent log to open the Log Side panel with the logs details.

    The details of the logs are not processed into attributes.

11. Click the **Terminal 2** tab. Then, click each of these commands to run them in the terminal.

    `curl -X GET 'http://localhost:8080/think/?subject=technology'`{{execute T2}}

    `curl -X GET 'http://localhost:8080/think/?subject=religion'`{{execute T2}}

    `curl -X GET 'http://localhost:8080/think/?subject=war'`{{execute T2}}
    
    `curl -X GET 'http://localhost:8080/think/?subject=work'`{{execute T2}}

    `curl -X GET 'http://localhost:8080/think/?subject=music'`{{execute T2}}

12. Navigate to the <a href="https://app.datadoghq.com/logs" target="_datadog">**Log Explorer**</a> and find the logs for these commands in the list.

    

