
all: read-resource post-resource

read-resource:
	docker build -t apptweak/slack-read-resource -f read/Dockerfile .

post-resource:
	docker build -t apptweak/slack-post-resource -f post/Dockerfile .
