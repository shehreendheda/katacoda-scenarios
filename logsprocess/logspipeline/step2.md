The first step in processing the `service:flog` logs is to add a <a href="https://docs.datadoghq.com/logs/processing/processors/?tab=ui#grok-parser" target="_blank">Grok Parser</a> to pipeline to extract log attributes. Remember when you viewed the log details, you noted that the logs have a similar structure. Let's breakdown the structure of the logs and write a parsing rule for it.

An example log is `53.166.47.138 - nienow5151 [11/Nov/2020:22:53:40 +0000] "PUT /implement HTTP/1.1" 100 30792 "http://www.productnetworks.org/transition/integrate/cross-platform" "Mozilla/5.0 (iPhone; CPU iPhone OS 8_3_2 like Mac OS X; en-US)"`. 

Breaking down the structure of the log gives the following:

| Text                                                                  | Attribute               |
| --------------------------------------------------------------------- | ----------------------- |
| 53.166.47.138                                                         | `network.client.ip`     | 
| -                                                                     | `http.ident`            |
| nienow5151                                                            | `http.auth`             |
| [11/Nov/2020:22:53:40 +0000]                                          | `date`                  |
| PUT                                                                   | `http.method`           |
| /implement                                                            | `http.url`              |
| 1.1                                                                   | `http.version`          |
| 100                                                                   | `http.status_code`      |
| 30792                                                                 | `network.bytes_written` |
| http://www.productnetworks.org/transition/integrate/cross-platform    | `http.referer`          |
| Mozilla/5.0 (iPhone; CPU iPhone OS 8_3_2 like Mac OS X; en-US)        | `http.useragent`        |

Refering to the <a href="https://docs.datadoghq.com/logs/processing/parsing/overview" target="_blank">%{MATCHER:EXTRACT:FILTER} syntax</a> in the <a href="https://docs.datadoghq.com/logs/processing/processors/?tab=ui#grok-parser" target="_blank">Grok Parser</a> documentation, you can use the following matchers and parsing elements.

| Matcher    | Attribute               | Pattern                                   |
| ---------- | ----------------------- | ------------------------------------------|
| `ip`       | `network.client.ip`     | %{ip:network.client_ip}                   |
| `notSpace` | `http.ident`            | %{notSpace:http.ident:nullIf("-")}        |
| `notSpace` | `http.auth`             | %{notSpace:http.auth:nullIf("-")}         |
| `date`     | `date`                  | \[%{date("dd/MM/yyyy:HH:mm:ss Z"):date}\] |
| `word`     | `http.method`           | %{word:http.method}                       |
| `notSpace` | `http.url`              | %{notSpace:http.url}                      |
| `number`   | `http.version`          | %{number:http.version}                    |
| `integer`  | `http.status_code`      | %{number:http.status_code}                |
| `integer`  | `network.bytes_written` | %{integer:network.bytes_written}          |
| `notSpace` | `http.referer`          | %{notSpace:http.referer}                  |
| `data`     | `http.useragent`        | %{data:http.useragent}                    |

Putting it all together, you get the following rule:
`rule %{ip:network.client.ip} %{notSpace:http.ident:nullIf("-")} %{notSpace:http.auth:nullIf("-")} \[%{date("dd/MMM/yyyy:HH:mm:ss Z"):date}\] "%{word:http.method} %{notSpace:http.url} HTTP\/%{number:http.version}" %{number:http.status_code} %{integer:network.bytes_written} "%{notSpace:http.referer}" "%{data:http.useragent}"`

With the rule written, let's create the Grok Parser.

1. Expand the new `apache - flog` pipeline you created and click **Add Processor**.

    ![new-flog-pipeline](logspipeline/assets/new-flog-pipeline.png)
     
2. Under **Select the processor type**, select **Grok Parser**.

3. In the **Logs** browser tab, click a log detail.

    Copy the log message (text in gray box) into the log sample. Note: There is a copy icon in the upper right corner of the log message. Click the icon to copy the log message.

3. In the Grok Parser, paste the log sample into the **Log samples** field.

4. Click the rule below to copy it and then paste it into the **Define parsing rules** field.

    `rule %{ip:network.client.ip} %{notSpace:http.ident:nullIf("-")} %{notSpace:http.auth:nullIf("-")} \[%{date("dd/MMM/yyyy:HH:mm:ss Z"):date}\] "%{word:http.method} %{notSpace:http.url} HTTP\/%{number:http.version}" %{number:http.status_code} %{integer:network.bytes_written} "%{notSpace:http.referer}" "%{data:http.useragent}"`{{copy}}

    Notice that the rule matches the sample and extract the attributes.

5. Enter `Using custom rule`{{copy}} for **Name the processor** and click **Save**.

    ![grok-parser](logspipeline/assets/grok-config.png)

6. In the **Logs** browser tab, close the log details if it is open. Scroll to the top of the list for the most recent logs. You'll notice that there is a pause in the log stream while the new processor is starting to process incoming logs. When new logs start coming in, click a new `flog` log.

    ![log-parsed-full](logspipeline/assets/log-parsed-full.png)
    
    Notice that the **Event Attributes** list is now populated because the Grok Parser is successfully extracting attributes from the logs.

    Use the up and down arrow keys to look at more logs. You'll notice, with a exception of a rare few, the logs are now parsed. (The logs that are exceptions would be interesting to explore to understand why they are not parsed.)

4. In the **Facets** on the left, browse and see what facets is available. 

    Grok parsing the logs has allowed Datadog to recognize common attributes and fill in the Facets.

    In the log details, click an attribute listed in the **Event Attributes**. In the menu that appears, you will see **Edit facet for xxx*** if the Facet exists or **Create facet for xxx** if the Facet does not exist. You can read the <a href="https://docs.datadoghq.com/logs/explorer/facets/" target="_blank">Log Facets documentation</a> to learn more. 

Now that attributes are being parsed from the logs, let's start using other processors like remappers and parsers to further enrich the logs.