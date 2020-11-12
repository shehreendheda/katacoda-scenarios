Let's use the log sample below to build out the rule.

`53.166.47.138 - nienow5151 [11/Nov/2020:22:53:40 +0000] "PUT /implement HTTP/1.1" 100 30792 "http://www.productnetworks.org/transition/integrate/cross-platform" "Mozilla/5.0 (iPhone; CPU iPhone OS 8_3_2 like Mac OS X; en-US)"`


`rule %{ip:network.client.ip} %{notSpace:http.ident:nullIf("-")} %{notSpace:http.auth:nullIf("-")} \[%{date("dd/MMM/yyyy:HH:mm:ss Z"):date}\] "%{word:http.method} %{notSpace:http.url} HTTP\/%{number:http.version}" %{number:http.status_code} %{integer:network.bytes_written} "%{notSpace:http.referer}" "%{data:http.useragent}"`


| Matcher    | Attribute               | Description                                  |
| ---------- | ----------------------- | -------------------------------------------- |
| `ip`       | `network.client.ip`     | The client ip address.                       |
| `notSpace` | `http.ident`            | The HTTP identification protocol             |
| `notSpace` | `http.auth`             | The HTTP authentification                    |
| `date`     | `"dd/MM/yyyy:HH:mm:ss Z"`|
| `word`     | `http.method`           | The HTTP method associated with the request. |
| `notSpace` | `http.url`              | The URL associated with the request.         |
| `number`   | `http.version`          | The HTTP version used.                       |
| `integer`  | `http.status_code`      | The status code returned.                    |
| `integer`  | `network.bytes_written` | The amount of bytes of the HTTP response.    |
| `notSpace` | `http.referer`          | The referer of the request.                  |
| `data`     | `http.useragent`        | The User-Agent associated with the request.  |


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


| Text                                                                  | Pattern                                   |
| --------------------------------------------------------------------- | ----------------------------------------- |
| 53.166.47.138                                                         | %{ip:network.client_ip}                   |
| -                                                                     | %{notSpace:http.ident:nullIf("-")}        |
| nienow5151                                                            | %{notSpace:http.auth:nullIf("-")}         |
| [11/Nov/2020:22:53:40 +0000]                                          | \[%{date("dd/MM/yyyy:HH:mm:ss Z"):date}\] |
| PUT                                                                   | %{word:http.method}                       |
| /implement                                                            | %{notSpace:http.url}                      |
| 1.1                                                                   | %{number:http.version}                    |
| 100                                                                   | %{number:http.status_code}                |
| 30792                                                                 | %{integer:network.bytes_written}          |
| http://www.productnetworks.org/transition/integrate/cross-platform    | %{notSpace:http.referer}                  |
| Mozilla/5.0 (iPhone; CPU iPhone OS 8_3_2 like Mac OS X; en-US)        | %{data:http.useragent}                    |


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