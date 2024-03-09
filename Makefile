start-kubernetes: start-namespace start-payment-ms start-order-ms

start-namespace:
	kubectl apply -f ./namespace.yaml

start-payment-ms:
	kubectl apply -f ./payment-ms/database/
	kubectl apply -f ./payment-ms/api/

start-production-ms:
	kubectl apply -f ./production-ms/database/
	kubectl apply -f ./production-ms/api/

start-order-ms:
	kubectl apply -f ./order-ms/database/
	kubectl apply -f ./order-ms/api/

delete-namespace:
	kubectl delete all --all --namespace tech-challenge

create-db:
	kubectl exec -i deploy/database -n tech-challenge -- mysql -u user -ppassword FIAP_CHALLENGE < dump-database.sql