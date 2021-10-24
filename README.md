# OWASP-bWAPP Docker
This is a docker image containing OWASP [bWAPP](http://www.itsecgames.com)

This docker image is based on https://registry.hub.docker.com/u/tutum/lamp/ 

Build image:
```docker build -t bwapp .```

Start container:
```docker run -d --rm -p 80:80 --name bwapp bwapp```

Setup bWAPP:
```http://localhost/install.php``` 
