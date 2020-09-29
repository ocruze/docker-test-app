compile-app:
	composer update

run-tests:
	php bin/phpunit

travis: compile-app run-tests docker-login docker-push

docker-login:
	echo ${DOCKER_PASSWORD} | docker login -u ${DOCKER_USERNAME} --password-stdin

docker-push:
	docker build --pull -t ${DOCKER_IMAGE_NAME} .
	docker push ${DOCKER_IMAGE_NAME}

deploy: compile-app
	echo "TODO: deploying app"