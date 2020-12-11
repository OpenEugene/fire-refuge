# Fire Refuge

Welcome to the Fire Refuge project! We are glad you are here! :tada:

We are helping folks find temporary refuge from fire impacted zones.  More project info at [Democracy Lab](https://www.democracylab.org/index/?section=AboutProject&id=528) where we attended a few [hacks](https://www.democracylab.org/index/?section=AboutEvent&id=8). There you will find links to the project management [Trello](https://trello.com/b/bsUkK6RQ/project-fire-refuge).  This repo and the issues here are specific to the technical implimentation.  There are more ways to contribute and you can volunteer at [Democracy Lab](https://www.democracylab.org/index/?section=AboutProject&id=528).

A subset of regional disaster response data from [COAD](https://lane.recovers.org/) effort for the wildfires in 2020. 

## Getting started

Our technology stack from back to front is Docker, Postgres, Asp.Net, Blazor. The only tool you need for this project is [Visual Studio](https://visualstudio.microsoft.com/vs/). But you can alternatively use the CLI and your favorite code editor.  This getting started guide will focus on vidual studio for brevity. We are deploying using docker, so it's a great idea to install [Docker Desktop](https://docs.docker.com/get-docker/) and activate K8s.  More on K8s and deployment later.  Postres is the database so you can install that [locally](https://www.postgresql.org/download/) or as a [docker container](https://hub.docker.com/_/postgres/). 

1. Install [Visual Studio](https://visualstudio.microsoft.com/vs/)
2. Install [Postgres](https://www.postgresql.org/download/)
    - remember the admin username and password
3. Optionally install a database tools like [DBeaver](https://dbeaver.io/) and [Azure Data Studio](https://docs.microsoft.com/en-us/sql/azure-data-studio/quickstart-postgres)
    - create a local database, name it FireRefuge
3. Create local tables using the scripts in [/sql](https://github.com/OpenEugene/fire-refuge/tree/master/FireRefuge/Server/SQL)
4. Change the connection string to match you username and password
5. Run the app!



