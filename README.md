This site is using the static-site generator [Nanoc](https://nanoc.ws/).

You'll also need a [Ruby](https://www.ruby-lang.org/) installation, as well as [Bundler](https://bundler.io/).

Clone this repository, and install its Ruby dependencies by running:

    $ bundle install --path ~/.gem

Then, to compile the site, run:

    $ bundle exec nanoc live

This will rebuild the site when you change stuff. You can view it at `localhost:3000`, by default.

Basic file structure:

- In `content`, there's a directory for each page of this website, containing the main text in Markdown format, as well as associated images
- `layouts` contains SLIM templates with eRuby tags
- `lib` contains helper functions and custom Nanoc filters

You can define an upload path in `nanoc.yaml` and then use `bundle exec nanoc deploy` to deplay the page.

License
=======

We release the content of the `lib` and `layouts` directories, as well as all top-level files under the GPLv3, or (at your option) any later version.
