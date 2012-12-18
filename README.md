Corset
======

A simple script to set the right CORS configuration for an S3 bucket. This
should really be a Gem.

Create a `.env` file with:

* `AWS_ACCESS_KEY_ID`
* `AWS_SECRET_ACCESS_KEY`
* `FOG_DIRECTORY` (the S3 bucket name)
* `AWS_CORS_ALLOWED_ORIGIN` (the allowed origin)

Note that you can't use `*` as the allowed origin if you plan on distributing
the bucket via Cloudfront. Currently Cloudfront caches the origin of the first
request.

Then  run:

```bash
$ export $(cat .env) && bundle exec ruby corset.rb
```
