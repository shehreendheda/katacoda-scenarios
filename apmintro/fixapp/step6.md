Inefficient database querying can affect service performance. N+1 queries are a common example in which the database is queried multiple times to retrieve data that can be retrieved with just one database query. 

In the Storedog app, the discount service is making N+1 queries to the postgres database. Let's identify the 

1. Navigate to <a href="https://app.datadoghq.com/apm/resource/store-frontend/rack.request/69d105fa043dba7f?end=1593549125250&env=ruby-shop&index=apm-search&paused=false&start=1593545525250&query=env%3Aruby-shop%20service%3Astore-frontend%20operation_name%3Arack.request%20resource_name%3A%22Spree%3A%3AHomeController%23index%22" target="_datadog">**APM** > **Services** > **store-frontend** > **Spree::HomeController#index**</a>.

2. In **Span Summary**, click the **AVG SPANS/TRACE** column header to sort the column in descending order. <p> Notice that the majority of traces have > 200 spans for types of queries to the postgres service. 

3. In **Traces**, click any span. 

4. In the **Flame Graph**, hover over the spans below the end of **discounts.status */discounts*** span and scroll to zoom in on the spans. <p> Notice that there are numerous spans of the two queries you saw listed in the Span Summary in step 2 above. <p> Let's replace the N+1 queries with one query that retrieves the same data.

5. Click `discounts-service/discounts.py`{{open}}.

6. Update **line 29** based on the note in lines 27-28. <p> **Line 29** should now be `discounts = Discount.query.options(joinedload('*')).all()`. <p> Let's restart the app to apply the change.

7. Click `docker-compose -f docker-compose-broken-instrumented.yml up -d`{{execute}}.

8. In the Traces list in <a href="https://app.datadoghq.com/apm/resource/store-frontend/rack.request/69d105fa043dba7f?end=1593549125250&env=ruby-shop&index=apm-search&paused=false&start=1593545525250&query=env%3Aruby-shop%20service%3Astore-frontend%20operation_name%3Arack.request%20resource_name%3A%22Spree%3A%3AHomeController%23index%22" target="_datadog">**APM** > **Services** > **store-frontend** > **Spree::HomeController#index**</a>, wait to till you see new traces coming in.

9. Click a new trace and zoom in on the `postgres.query` span below the **discounts.status */discounts***. Notice that this is only one span now.

As you've seen in this activity, Datadog APM enables you to investigate and diagnose a variety of issues that affect performance of services and endpoints in your applications.


### Assessment
Click `grademe`{{execute}} to receive a grade for this activity.