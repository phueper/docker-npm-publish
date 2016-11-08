# docker setup to `npm publish` modules from a clean checkout environment

since i published "dirty" npm modules that contain files in my checkout that shouldn't be in the module,
i created this... i try to be repository/module agnostic, but it is pretty much created for the js-joda
Release workflow :)

# TODO

- verify checkout is clean!

## for testing
- run test on master?
- verify latest master?
- if test ok

# for publish
- checkout tag
- verify tag is checked out
- verify tag test run results on travis???
- run `npm publish`

