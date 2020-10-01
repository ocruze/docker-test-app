compile-app:
	composer update

compile-app-prod:
	composer update --no-dev

run-tests:
	php bin/phpunit

travis: compile-app run-tests

deploy: compile-app-prod
	echo "TODO: deploying app"