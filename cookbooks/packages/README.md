[![Build Status](https://travis-ci.org/mattray/packages-cookbook.png)](https://travis-ci.org/mattray/packages-cookbook)

Description
===========

Trivial cookbook to manage a list of packages from an attribute.

Attributes
==========

Note that we namespace the attributes with `packages-cookbook` so we don't conflict with the Ohai-generated attributes.

packages-cookbook
-----------------

Determines package names to manage with the `package` resource in Chef in the `packages::default` recipe. It can be specified as an array of strings that are packages to install, or as a hash of packages with an action to take.

In this example:

```ruby
node.default['packages-cookbook'] = ['git', 'openssl']
```

The `git` and `openssl` packages will be installed.

In this example, using a hash of packages and actions:

```ruby
node.default['packages-cookbook'] = {'git' => 'install', 'openssl' => 'upgrade', 'xorg-common' => 'remove'}
```

The `git` package will be installed, `openssl` will be upgraded, and `xorg-common` will be removed.

packages-cookbook_default_action
--------------------------------

Determines the default action that the package resource will take on the list of packages. By default this is `"install"`. Has no effect if the `packages-cookbook` attribute is a hash.

Recipe
=======

default
-------

The recipe installs the packages specified in the `node['packages-cookbook']` attribute. It will use Chef 12.1.0's "multipackage" feature if the attribute is an array.

License and Author
==================

Author:: Matt Ray (<matt@chef.io>)

Author:: Joshua Timberman (<joshua@chef.io>)

Copyright 2013-2016 Chef Software, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
