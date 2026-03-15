# README at Repositories

A Redmine plugin that displays the contents of `README.md` at the top of the Repository tab.

## Requirements

- Redmine 2.x or later (tested up to 5.x)
- Rails 6.x or later

## Installation

```bash
cd $REDMINE_ROOT/plugins
git clone https://github.com/simeji/readme_at_repositories.git
bundle exec rake redmine:plugins:migrate RAILS_ENV=production
```

Then restart your Redmine server.

## Usage

### Enable the plugin for your project

Go to **Settings** → **Modules** and enable **Readme at repository**.

![Project Module](https://raw.githubusercontent.com/wiki/simeji/readme_at_repositories/assets/img/project_module.png)

### View README in the Repository tab

Open the **Repository** tab. The contents of `README.md` are displayed at the top of the page — in any directory.

![Repository Tab](https://raw.githubusercontent.com/wiki/simeji/readme_at_repositories/assets/img/repository_view.png)

> `.md` files are rendered as Markdown. `.txt` and `.rdoc` are also supported (displayed as plain text).

### Configure display position

You can change where the README appears via **Settings** → **Readme at repository** within the project.

![Project Settings](https://raw.githubusercontent.com/wiki/simeji/readme_at_repositories/assets/img/project_setting.png)

To control who can change this setting, go to **Administration** → **Roles and permissions**.

![Roles and Permissions](https://raw.githubusercontent.com/wiki/simeji/readme_at_repositories/assets/img/permission.png)

## License

MIT — see [LICENSE](LICENSE) for details.
