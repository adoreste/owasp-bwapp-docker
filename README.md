# OWASP-bWAPP
This is a docker image containing OWASP [bWAPP](http://www.itsecgames.com)

This docker image is based on https://registry.hub.docker.com/u/tutum/lamp/ 

Build image:
```docker build -t bwap .```

Start container:
```docker run -d --rm -p 80:80 --name bwap bwap```

Setup bWAPP:
```http://localhost/install.php``` 

