vcl 4.0;

import directors;
import std;


backend site1 {
        .host = "httpd-server";
        .port = "80";

}

backend site2 {
        .host = "httpd-server";
        .port = "80";
}

sub vcl_recv {

   if (req.http.host == "app1-virtapp.io") {
        set req.backend_hint = site1;
    }
    if (req.http.host == "app2-virtapp.io") {
        set req.backend_hint = site2;
    }
}
