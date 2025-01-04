# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [Unreleased]

- Improved CHANGELOG.md file.

## [0.3.4] - 2024-08-30

### Added

- Ability to retrieve users by id with `client.users.get_by_id('id')`.

### Changed

- Upgrade dependencies: faraday, mocha and minitest.

## [0.2.4] - 2024-05-23

### Changed

- Upgrade dependencies: mocha and minitest.

## [0.2.3] - 2024-05-04

### Added

- Dependabot configuration file to keep dependencies up to date.

### Changed

- Upgrade dependencies: mocha, rake, and minitest.

## [0.2.2] - 2023-11-11

### Added

- Check consistency of gem version with git tag.

### Fixed

- Fix issue that prevented gem from being loaded.

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

## [0.1.0] - 2023-08-28

- Initial release

[0.3.4]: https://github.com/betogrun/lean-microsoft-graph/compare/v0.2.4...v0.3.4
[0.2.4]: https://github.com/betogrun/lean-microsoft-graph/compare/v0.2.3...v0.2.4
[0.2.3]: https://github.com/betogrun/lean-microsoft-graph/compare/v0.2.2...v0.2.3
[0.2.2]: https://github.com/betogrun/lean-microsoft-graph/compare/v0.2.1...v0.2.2
[0.2.1]: https://github.com/betogrun/lean-microsoft-graph/compare/v0.2.0...v0.2.1
[0.2.0]: https://github.com/betogrun/lean-microsoft-graph/releases/tag/v0.2.0