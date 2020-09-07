## x.x.x (Month Day, Year)

#### Features

#### Fixes

## 3.0.11 (September 07, 2020)

#### Fixes

* Fix not forcing AMD64 during Windows minion install


## 3.0.10 (September 07, 2020)

#### Fixes

* Fix not using specified version in `salt::minion::install`


## 3.0.9 (September 07, 2020)

#### Fixes

* Fix capitalisation error in url used to fetch windows installer


## 3.0.8 (September 07, 2020)

#### Fixes

* Removed double reference to target in repo.pp


## 3.0.7 (September 07, 2020)

#### Fixes

* Fix not referencing full file path in repo.pp

## 3.0.6 (September 07, 2020)

#### Fixes

* Change backwards slashes to forward slashes in data/os/windows.yaml

## 3.0.5 (September 07, 2020)

#### Fixes

* Surround values in data/os/windows.yaml with quotation marks

## 3.0.2/3.0.3/3.0.4 (September 07, 2020)

#### Fixes

* Only set `$release` in repo if os family is not Windows

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
