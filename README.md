## Corset

A simple ruby gem to set the right CORS configuration for an S3 bucket.

## Installation

```bash
$ gem install corset
```

## Usage

Create a `.env` file with:

* `AWS_ACCESS_KEY_ID`
* `AWS_SECRET_ACCESS_KEY`
* `FOG_DIRECTORY` (the S3 bucket name)
* `AWS_CORS_ALLOWED_ORIGIN` (the allowed origin)

Note that you can't use `*` as the allowed origin if you plan on distributing
the bucket via Cloudfront. Currently Cloudfront caches the origin of the first
request.

Then run:

```bash
$ export $(cat .env) && corset set
```
