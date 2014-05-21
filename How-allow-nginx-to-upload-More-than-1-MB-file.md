
By Default Nginx will allow to upload 1 MB file
By Using below Directive we can upload upto 10 MB 
If we need to upload larger than 10 MB Just replace 10 with your specifed size

```
client_body_in_file_only clean;
client_body_buffer_size 32K;
client_max_body_size 10M;
```