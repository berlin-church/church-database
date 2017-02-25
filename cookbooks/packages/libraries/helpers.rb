#
# Copyright 2015, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# There isn't an easy way to duck-type whether the package provider on
# an arbitrary platform supports multipackage. While we know it's
# available in Chef 12.1.0+, it is better to ask for the feature,
# rather than ask for the Chef version.
def multipackage_supported?
  Chef::Resource::Package.new([], nil).package_name([])
  Chef::Log.debug('This version of Chef supports "multipackage"')
  true
rescue Chef::Exceptions::ValidationFailed
  Chef::Log.debug('This version of Chef does not support "multipackage"')
  false
end
