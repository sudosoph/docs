# docs
Section documentation

## Install hugo
https://gohugo.io/getting-started/installing

## Clone recursively
`git clone --recursive https://github.com/section-io/docs.git`

## Run hugo
`hugo server --watch`

### Issues

With the latest version of the hugo (tested with version 0.53) you may run into the following error when building the docs locally :

```
/docs/themes/docdock/layouts/partials/logo.html:1:9": execute of template failed: template: partials/logo.html:1:9: executing "partials/logo.html" at <where .Site.Pages "S...>: error calling where: Source isn't a field of struct type *hugolib.Page
```

To fix this issue remove the word `.Source` from `.Source.Filename` in the file `/docs/themes/docdock/layouts/partials/logo.html` and build again.

You might need to change remote url for push

`git remote set-url origin git@github.com:section-io/docs.git`

You might want to disable fast rendering

`hugo server --watch --disableFastRender`