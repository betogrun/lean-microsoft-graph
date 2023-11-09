# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [0.2.1] - 2023-11-09

### Added

- Missing tests for resource class.
- Github action to run tests on push and pull requests.
- Github action to publish new versions to Rubygems.

### Fixed

- Fix error message parser when handling responses.

### Removed

- The .tool-versions file from repository. Now it is ignored.

## [0.2.0] - 2023-11-04

### Added

- Ability to count users with `client.users.count`.
- Ability to retrieve users per page with `client.users.get_all(per_page)`.
- Ability to retrieve users by reference with `client.users.get_all_by_reference('reference')`.

## [Unreleased]

## [0.1.0] - 2023-08-28

- Initial release

[0.2.1]: https://github.com/betogrun/lean_microsoft_graph/releases/tag/v0.2.1
[0.2.0]: https://github.com/betogrun/lean_microsoft_graph/releases/tag/v0.2.0