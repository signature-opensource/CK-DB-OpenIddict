using Microsoft.AspNetCore.Builder;

var builder = WebApplication.CreateBuilder( args );
var app = builder.Build();

app.MapGet( "/", () => "Hello World!" );

app.Run();
