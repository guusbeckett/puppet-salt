## x.x.x (Month Day, Year)

#### Features

#### Fixes
## 3.0.1 (September 07, 2020)

#### Fixes

* Rename `data/os/Windows.yaml` to `data/os/windows.yaml`

## 3.0.0 (September 07, 2020)

#### Features

* added Windows support
* added Per-OS data files
* reintroduced parameter `salt::repo::base_repo_url`
* introduced variables `salt::minion::base_repo_url` `salt::master::base_repo_url` `salt::syndic::base_repo_url` `salt::api::base_repo_url` to enable users to configure `base_repo_url` in Foreman and other ENC


## 2.0.0 (May 06, 2020)

#### Features

* !! REMOVED parameter `salt::repo::base_repo_url`
* added parameter `salt::repo::repo_url` to set full custom repo url
* added parameter `salt::repo::release` to set release to use in the apt source string
* added parameter `salt::(master|minion|api|syndic)::repo_manage` to disable / enable repo management

## 1.1.0 (January 28, 2020)

#### Features
* added class to manage salt-syndic

## 1.0.1 (October 30, 2019)

#### Features
* added Debian 10 support

#### Fixes
* fix some package dependencies

## 1.0.0 (September 9, 2019)

* initial release
