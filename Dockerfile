FROM redhat/ubi8  
LABEL name="ashutoshh"
LABEL email="ashutoshh@linux.com"
# label is optional but to share image owner details to users 
RUN dnf install dotnet-sdk-8.0 -y  
RUN mkdir /vijayapp 
COPY sample-dotnetweb-app /vijayapp/
WORKDIR /vijayapp
RUN dotnet build -o vijaybin 
RUN dotnet publish -o vijay_publish -p:AssemblyName=vijaydotnet
# while publish i can change the name of app
CMD ./vijay_publish/vijaydotnet --urls=http://0.0.0.0:5000
# must be the final keyword of dockerfile which will run your app
