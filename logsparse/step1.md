1. In the **Terminal 2** tab, take a look at the **docker-compose.yml** file. 
   
   `more docker-compose.yml`{{execute T2}}
   
   *Notice that port 10520 is being exposed on the localhost as port 10520*
   
2. Press **q** to quit the `more` command.

3. Now telnet to that port on localhost:

   `telnet localhost 10520`{{execute T2}}

   *Anything you type at the prompt will be sent to the platform when you press Enter. It's not sent immediately but it should appear in the Log Explorer viewer within a minute.*

4. Type the following message and press Enter:

   `Error - connection refused`{{execute T2}}

5. Open the <a href="https://app.datadoghq.com/logs" target="_datadog">**Log Explorer**</a> and search for `service:testtcp` to filter the list for the new log line.
   
   ![Defaults to INFO](/sdheda/scenarios/logsparse/assets/defaultsinfo2.png)

   *Without updating severity, it defaults to INFO*

   *What is the status of your log message in the platform right now? You can see status at the top of the log message once you click on it. It shows as **Info** whereas you would have expected to have this as an **Error**. To change this we will need to have specific processing rules to extract the severity and the error message.*

6. Navigate to <a href="https://app.datadoghq.com/logs/pipelines" target="_datadog">**Configurations > Pipelines**</a> and create a **New Pipeline**. 

   Type `service:testtcp` for **Filter** and set the **Name** to `Getting Started with Pipelines`. Click **Save**.

   ![New Pipeline](/sdheda/scenarios/logsparse/assets/newpipeline2.png)

7. Click the pipeline you created in the Pipelines list and **Add Processor** to the pipeline. 

   For **Select the processor type**, choose `Grok Parser` 
   
   For **Logs samples**, enter
   `Error - connection refused`
   
   For **Define parsing rule**, enter
   `myrule %{word:error.level} - %{data:error.message}`
   
   *The extraction will appear below the rule.*
   
   Enter a name and click **Save**.
   
   ![New Grok Parser](/sdheda/scenarios/logsparse/assets/newgrokparser.png)

8. Next we need a Status remapper to remap the value of the "level" attribute to the global log severity. **Add Processor** in the pipeline. 

   For **Select the processor type**, choose `Status Remapper` 

   For **Set status attribute(s)**, enter `error.level`

   Enter a name and click **Save**.
   
   ![New Status Remapper](/sdheda/scenarios/logsparse/assets/newstatusremapper.png)

9. Send the `Error - connection refused`{{execute T2}} line again. 
   
   Note: If you see `Connection closed by foreign host.` in **Terminal 2**, you will need to telnet to the port again using `telnet localhost 10520`{{execute T2}} before you enter the Error message.

10. Navigate to <a href="https://app.datadoghq.com/logs" target="_datadog">**Log Explorer**</a> and search for **service:testtcp**.

    ![Shows Error Status](/sdheda/scenarios/logsparse/assets/errorstatus.png)
    
    *Notice that your old logs are not impacted. All the processors are applied at ingestion so it does not impact already existing logs. This is very important! You cannot make a modification to an existing log.*

11. To see that it works even for JSON formatted logs, send the following line from telnet:
    `{"error.level":"warning","var1": 10,"error.message":"I told you it would work"}`{{execute T2}}
   
    ![JSON logs](/sdheda/scenarios/logsparse/assets/jsonlogs2.png)
    
    *If it doesn't seem to work, make sure that the log you sent has the correct JSON format. Sometimes copy and paste can introduce 'smart quotes' that aren't recognized by the JSON parser. You can try verifying the JSON with https://jsonlint.com/.*

Now that you have created a simple pipeline, let's move on to a few others that you can try on your own.

