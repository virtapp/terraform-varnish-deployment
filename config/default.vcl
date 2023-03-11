vcl 4.0;

import directors;
import std;


backend app1 {
        .host = "httpd-server";
        .port = "8080";

}

backend app2 {
        .host = "httpd-server";
        .port = "8080";
}

sub vcl_recv {

   if (req.http.host == "app1.virtapp.io") {
        set req.backend_hint = app1;
    }
    if (req.http.host == "app2.virtapp.io") {
        set req.backend_hint = app2;
    }
}