{
  "title": "Instrumenting a Kubernetes App Deployment",
  "description": "Instrumenting a K8s App Deployment",
  "difficulty": "Beginner",
  "time": "20 minutes",
  "details": {
    "intro": {
      "courseData": "background.sh",
      "code": "foreground.sh",
      "text": "intro.md"
    },
    "steps": [
      {
        "title": "Preparing the Environment",
        "text": "step1.md"
      },
      {
        "title": "Instrumenting a Ruby-on-Rails App Service",
        "text": "step2.md"
      },
      {
        "title": "Instrumenting Python-Flask App Services",
        "text": "step3.md"
      },
      {
        "title": "Enabling Trace Collection by the Datadog Agent",
        "text": "step4.md"
      },
      {
        "title": "Deploying and Monitoring the Application",
        "text": "step5.md"
      }
    ],
    "finish": {
      "text": "finish.md"
    },
    "assets": {
    "host01": [
      {
        "file": "prepenvironment",
        "target": "/usr/local/bin",
        "chmod": "+x"
      },
      {
        "file": "datadog-agent.yaml",
        "target": "/root/datadog/"
      },
      {
        "file": "datadog-agent-uninstrumented.yaml",
        "target": "/root/datadog/"
      },
      {
        "file": "serviceaccount.yaml",
        "target": "/root/datadog/"
      },
      {
        "file": "datadog-agent-with-cluster-agent.yaml",
        "target": "/root/datadog/"
      },
      {
        "file": "datadog-cluster-agent.yaml",
        "target": "/root/datadog/"
      },
      {
        "file": "cluster-agent-external-metrics.yaml",
        "target": "/root/datadog/"
      }
    ]
    }
  },
  "environment": {
    "uilayout": "editor-terminal",
    "uieditorpath": "/root/datadog",
    "showdashboard": true,
    "dashboards": [
      {
        "name": "storedog",
        "port": 30001
      }
    ]
  },
  "backend": {
    "imageid": "datadog-kubernetes-cluster-running:1.16"
  }
}