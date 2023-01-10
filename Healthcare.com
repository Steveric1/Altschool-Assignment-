server {
   listen {{ port }} default_server;
   listen [::]:{{ port }} default_server;
   root /var/www/{{ domain }};
   index index.html;
   server_name {{ domain }} {{ domain_https }};

   location / {
       try_files $uri $uri/ =404;
  }
}

