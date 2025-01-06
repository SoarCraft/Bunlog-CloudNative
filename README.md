# Bunlog

A Simple Personal Blog & Frontend Framework Course Sample Work

It has the same design as <https://Aloen.to/>

## Setup Cloudinary

```sh
echo $(cat ~/.kube/config | base64) | tr -d " "

printf "$swr_ak" | openssl dgst -binary -sha256 -hmac "$SK" | od -An -vtx1 | sed 's/[ \n]//g' | sed 'N;s/\n//'

docker login -u $project@$swr_ak -p $swr_sk $url

docker build -t $url/$organization/pgdb:latest -f Dockerfile.pg .

docker push $url/$organization/pgdb:latest

docker build -t $url/$organization/web:latest -f Dockerfile.web .

docker push $url/$organization/web:latest

kubectl apply -f k8s.yaml
```
