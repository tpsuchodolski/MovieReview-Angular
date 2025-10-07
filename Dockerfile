# Use the official ASP.NET image for .NET Framework 4.8
FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2019

# Set working directory
WORKDIR /inetpub/wwwroot

# Copy published files from build
COPY MovieReview.Web/publish/ .

# Expose port 80
EXPOSE 80