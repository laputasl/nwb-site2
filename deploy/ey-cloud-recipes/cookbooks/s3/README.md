S3
======

A chef recipe for configuring S3 on [EY Cloud]. This recipe will create a default `/data/<app_name>/shared/config/s3.yml` file for all applications in the cluster. 

To make use of this recipe you will also need to add a [deploy hook](https://cloud-support.engineyard.com/faqs/overview/getting-started-with-engine-yard-cloud#using_deploy_hooks) to your application to create a symlink for the s3 configuration. Just add a line like this to your `before_migrate.rb` hook:
    
    run "ln -nfs #{shared_path}/config/s3.yml #{release_path}/config/s3.yml"
    

[EY Cloud]: https://cloud.engineyard.com/extras