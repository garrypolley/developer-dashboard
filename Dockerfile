FROM microsoft/dotnet

ENV ASPNETCORE_URLS=http://0.0.0.0:8080
EXPOSE 8080

WORKDIR /DeveloperDashboard

# copy project.json and restore as distinct layers
COPY . .
RUN dotnet restore

RUN dotnet publish -c Release -o out
ENTRYPOINT ["dotnet", "./out/DeveloperDashboard.dll"]
