
## Default docker command output template format  

Here is the default templatefor docker output.  
File: ~/.docker/config [src: https://windsock.io/customising-docker-cli-output/ ]  
Sample:
```
{
  "auths" : {
    "https://index.docker.io/v1/" : {

    }
  },
  "credsStore" : "osxkeychain",
  "psFormat": "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Command}}\t{{.RunningFor}}\t{{.Status}}\t{{.Ports}}",
  "imagesFormat": "table {{.Repository}}:{{.Tag}}\t{{.ID}}\t{{.CreatedSince}}\t{{.Size}}"
}
```

Command |	Property |	Default Template
--- | --- |  --- 
docker config ls | configFormat | 	table {{.ID}}\t{{.Name}}\t{{.CreatedAt}}\t{{.UpdatedAt}}
docker container ls | psFormat | 	table {{.ID}}\t{{.Image}}\t{{.Command}}\t{{.RunningFor}}\t{{.Status}}\t{{.Ports}}\t{{.Names}}
docker image ls | imagesFormat | 	table {{.Repository}}\t{{.Tag}}\t{{.ID}}\t{{.CreatedSince}}\t{{.Size}}
docker network ls | networksFormat | 	table {{.ID}}\t{{.Name}}\t{{.Driver}}\t{{.Scope}}
docker node ls | 	nodesFormat	table |  {{.ID}} {{if .Self}}*{{else}} {{end}}\t{{.Hostname}}\t{{.Status}}\t{{.Availability}}\t{{.ManagerStatus}}
docker plugin ls | pluginsFormat | 	table {{.ID}}\t{{.Name}}\t{{.Description}}\t{{.Enabled}}
docker secret ls | 	secretFormat | 	table {{.ID}}\t{{.Name}}\t{{.CreatedAt}}\t{{.UpdatedAt}}
docker service ls | 	servicesFormat | 	table {{.ID}}\t{{.Name}}\t{{.Mode}}\t{{.Replicas}}\t{{.Image}}\t{{.Ports}}
docker service ps | 	tasksFormat | 	table {{.ID}}\t{{.Name}}\t{{.Image}}\t{{.Node}}\t{{.DesiredState}}\t{{.CurrentState}}\t{{.Error}}\t{{.Ports}}
docker volume ls | 	volumesFormat | 	table {{.Driver}}\t{{.Name}}
