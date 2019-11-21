# Deep Linking Metrics and Traces

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
