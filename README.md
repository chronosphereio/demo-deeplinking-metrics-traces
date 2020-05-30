# Deep Linking Metrics and Traces

This is a working demo that covers this "Deep Linking Metrics and Traces" from KubeCon 2019 San Diego's Observability track. [(talk)](https://kccncna19.sched.com/event/UaXX/deep-linking-metrics-and-traces-with-opentelemetry-openmetrics-and-m3-rob-skillington-chronosphere) [(slides)](https://static.sched.com/hosted_files/kccncna19/2e/Deep%20Linking%20Metrics%20and%20Traces%20with%20OpenTelemetry%2C%20OpenMetrics%2C%20Prometheus%20and%20M3%20%281%29.pdf) [(video)](https://www.youtube.com/watch?v=TzNZIEvhAdA)


All the forked sources and changes are present under https://github.com/chronosphereiox

## Prerequisites

- NodeJS 10.xx
- Go 1.13

The demo checks out the required repositories as sub-modules, builds the docker images and launches
them. Use:
```bash
make start
```
to run this the first time. This will take a while to build as it is building
grafana, prometheus, m3 and a couple of other things.

Once the images are built you can use the following to start and stop the demo.

```bash
make app_start # starts the demo

make app_stop # stops the demo
```

Once the demo is up traverse to http://localhost:8080/ to enable traffic through the demo jaeger app
and have the application emit traces and metrics.

The demo automatically provisions an M3Query data source and a sample grafana dashboard that shows 
a request success/failure metric with traces linked to individual datapoints if present. When you 
click on a datapoint in the series, if there is an associated trace the `Show Trace` button will 
take you to the jaeger view of that specific trace and span.
