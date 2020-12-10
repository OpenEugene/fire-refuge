#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mvpstudio/dotnet:v5.0 as base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:5.0-buster-slim AS build
WORKDIR /src
COPY ["Server/FireRefuge.Server.csproj", "Server/"]
COPY ["Shared/FireRefuge.Shared.csproj", "Shared/"]
COPY ["Client/FireRefuge.Client.csproj", "Client/"]
RUN dotnet restore "Server/FireRefuge.Server.csproj"
COPY . .
WORKDIR "/src/Server"
RUN dotnet build "FireRefuge.Server.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "FireRefuge.Server.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "FireRefuge.Server.dll"]