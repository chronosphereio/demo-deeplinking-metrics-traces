build_hotrod:
	cd jaeger-example && make hotrod-docker && \
	docker tag jaeger-example:latest jaeger-example:exemplars-demo

build_prometheus: 
	cd prometheus && GOOS=linux GOARCH=amd64 make build && mkdir -p .build/linux-amd64 &&  \
	mv ./prometheus ./.build/linux-amd64/prometheus && mv ./promtool ./.build/linux-amd64/promtool && make docker

build_m3: 
	cd m3 && make m3dbnode-docker-dev && docker tag m3dbnode:dev m3dbnode:exemplar-demo

build_grafana:
	cd grafana && make build-docker-full && \
	docker tag grafana/grafana:dev grafana/grafana:exemplars-demo

docker_start:
	cd docker && docker-compose up -d

docker_stop:
	cd docker && docker-compose down

m3_namespace_setup:
	while true; do curl -X POST http://localhost:7201/api/v1/database/create -d '{ \
  "type": "local", \
  "namespaceName": "default", \
  "retentionTime": "2h" \
}' && break; sleep 5; echo Retrying namespace setup; done

init:
	git submodule update --init --recursive

app_start: docker_start m3_namespace_setup

start: init build_hotrod build_prometheus build_m3 build_grafana app_start

stop: docker_stop
