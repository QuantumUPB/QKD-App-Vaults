.PHONY: zip broker

zip:
	zip -r qvault.zip . -x qvault.zip -x '.git/*'

broker:
	docker-compose up -d --build broker

