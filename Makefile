# standard info
REGISTRY = registry.giantswarm.io
PROJECT = ethereum
USERNAME :=  $(shell swarm user)
ORG := $(shell swarm env | cut -d"/" -f1)
ENV := $(shell swarm env | cut -d"/" -f2)
DOMAIN = $(PROJECT)-$(ORG)-$(ENV).gigantic.io
TOKEN := $(shell cat ~/.swarm/token)

# local info
MY_IP = $(shell boot2docker ip)

test:
	@echo "Please run 'make run' to run locally or 'make up' to deploy."

build:
	docker build -t $(REGISTRY)/$(ORG)/$(PROJECT) .

run: build
	@echo "#################################################################"
	@echo "The $(PROJECT) JSON-RPC is running at http://$(MY_IP):8545"
	@echo "#################################################################"

	docker run --rm -ti --name $(PROJECT)\
		-p 30303:30303 \
		-p 8545:8545 \
		$(REGISTRY)/$(ORG)/$(PROJECT)
	
push: build
	docker push $(REGISTRY)/$(ORG)/$(PROJECT)

pull:
	docker pull $(REGISTRY)/$(ORG)/$(PROJECT)

up: push
	swarm up \
	  --var=domain=$(DOMAIN) \
	  --var=org=$(ORG) \
	  --var=env=$(ENV) \
	  --var=app=$(PROJECT)

	@echo "####################################################"
	@echo "Your app '$(PROJECT)' is running at http://$(DOMAIN)"
	@echo "####################################################"
