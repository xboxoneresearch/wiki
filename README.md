# Xbox One Research wiki

[![GitHub Workflow - Build](https://img.shields.io/github/actions/workflow/status/xboxoneresearch/wiki/build.yml?branch=master)](https://github.com/xboxoneresearch/wiki/actions?query=workflow%3Abuild)

Various info regarding the hard-/software of the Xbox One gaming console family.

Python framework `mkdocs` is used to render the Markdown documentation.

## Contribute

Contributions are very welcome. Here's how you can help:

- Add / correct / expand technical information
- Improve documentation style
- Correct spelling / grammar
- Check ISSUES tab...

### Workflow

1. __Fork__ this repo
1. Make changes
1. __Verify__ your changes are formatted properly (otherwise the PR cannot be accepted)
1. Send a __Pull Request__

**NOTE**: When adding a new page, ensure it's linked in [NAVIGATION.md](./docs/NAVIGATION.md)

## Local testing

1. Clone your fork of the wiki (**Change 'yourusername' accordingly**)

```
git clone git@github.com:yourusername/wiki.git
```

2. Navigate into wiki repository folder

```
cd wiki/
```

3. Choose one of the two deployment methods below.

### Native deployment

1. Create & activate python virtual-environment (might need dependency `python3-venv`, see: <https://docs.python.org/3/library/venv.html>)

```
python3 -m venv venv
source venv/bin/activate
```

2. Install mkdocs and dependencies

```
pip install -r requirements.txt
```

3. Edit docs and verify with the following commands:

Serve the documentation (<http://127.0.0.1:8000>)
```
mkdocs serve --strict
```

Build the documentation
```
mkdocs build --strict
```

### Docker deployment

1. Execute docker container:

```
docker compose up
```

2. Navigate to <http://127.0.0.1:8000>
3. Make your changes and verify the formatting / linking still checks out
