# Use the official ASP.NET image for .NET Framework 4.8
FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2019

# Set working directory to IIS web root
WORKDIR /inetpub/wwwroot

# Copy published files from the build output
COPY publish/ .

# Expose port 80
EXPOSE 80